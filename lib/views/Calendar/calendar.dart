// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final CalendarController _controller = CalendarController();
  String season = "winter";
  var month = 11;

  Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(125, 156, 156, 156), width: 0.2)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.wb_sunny_outlined),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(details.date.day.toString()),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var viewHeaderColor = Colors.black38;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage("assets/images/$season.jpg"),
                  fit: BoxFit.cover)),
          child: SfCalendar(
            backgroundColor: const Color.fromARGB(69, 255, 255, 255),
            allowDragAndDrop: false,
            dragAndDropSettings: const DragAndDropSettings(
              allowNavigation: true,
              allowScroll: true,
              autoNavigateDelay: Duration(seconds: 1),
              indicatorTimeFormat: 'HH:mm a',
              showTimeIndicator: true,
            ),
            timeZone: "India Standard Time",
            dataSource: MeetingDataSource(_getDataSource()),
            viewHeaderStyle: ViewHeaderStyle(backgroundColor: viewHeaderColor),
            headerStyle: const CalendarHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: TextStyle(fontWeight: FontWeight.bold)),
            showNavigationArrow: true,
            view: CalendarView.month,
            controller: _controller,
            allowedViews: const [
              CalendarView.day,
              CalendarView.week,
              CalendarView.workWeek,
              CalendarView.month,
              CalendarView.timelineDay,
              CalendarView.timelineWeek,
              CalendarView.timelineWorkWeek
            ],
            monthCellBuilder: monthCellBuilder,
            onViewChanged: (ViewChangedDetails details) {
              // Approximately selects the middle date from list of visible dates
              month =
                  details.visibleDates[details.visibleDates.length ~/ 2].month;
              // print(details.visibleDates[details.visibleDates.length~/2]);
              // Change calendar bg based on season/month
              month >= 3 && month <= 6
                  ? changebg("summer")
                  : month >= 7 && month <= 9
                      ? changebg("monsoon")
                      : month >= 10 && month <= 11
                          ? changebg("spring")
                          : changebg("winter");
            },
            // handle all views
            onTap: (CalendarTapDetails calendarTapDetails) {
              print(calendarTapDetails.targetElement);

              // Tapping on header at any point opens month view
              if (calendarTapDetails.targetElement == CalendarElement.header) {
                _controller.view = CalendarView.month;
              }

              // Tapping at a time at day should open popup to add event with time pre-selected
              if (_controller.view == CalendarView.day &&
                  calendarTapDetails.targetElement ==
                      CalendarElement.calendarCell) {
                _showDatePickerPopup(context);
              }

              // More view handling
              if (_controller.view == CalendarView.month &&
                  calendarTapDetails.targetElement ==
                      CalendarElement.calendarCell) {
                _controller.view = CalendarView.day;
              } else if ((_controller.view == CalendarView.week ||
                      _controller.view == CalendarView.workWeek) &&
                  calendarTapDetails.targetElement ==
                      CalendarElement.viewHeader) {
                _controller.view = CalendarView.day;
              }
            },
            monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode:
                    MonthAppointmentDisplayMode.appointment),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.h, right: 20.w),
          child: FloatingActionButton(
              backgroundColor: Colors.blue[200],
              onPressed: () {
                _showDatePickerPopup(context);
              },
              child: const Icon(Icons.add)),
        ),
      ],
    );
  }

  Future<void> _showDatePickerPopup(BuildContext context) async {
    DateTime startDate = DateTime.now();
    DateTime endDate = DateTime.now().add(const Duration(days: 7));

    List<DateTime>? pickedDates = await showDialog<List<DateTime>>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Configure event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Start Date'),
                subtitle: Text('${startDate.toLocal()}'),
                trailing: const Icon(Icons.edit),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: startDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    startDate = pickedDate;
                  }
                },
              ),
              ListTile(
                title: const Text('End Date'),
                subtitle: Text('${endDate.toLocal()}'),
                trailing: const Icon(Icons.edit),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: endDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    endDate = pickedDate;
                  }
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop([startDate, endDate]);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    if (pickedDates != null && pickedDates.length == 2) {
      startDate = pickedDates[0];
      endDate = pickedDates[1];
      print('Start Date: $startDate');
      print('End Date: $endDate');
    }
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 19, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    meetings.add(Meeting(
        'Meeting',
        DateTime(today.year, today.month, today.day, 21, 0, 0),
        endTime,
        const Color.fromARGB(255, 134, 130, 15),
        false));
    meetings.add(Meeting(
        'Interview',
        DateTime(today.year, today.month, today.day, 22, 0, 0),
        endTime,
        const Color.fromARGB(255, 134, 80, 15),
        false));
    meetings.add(Meeting(
        'Interview',
        DateTime(today.year, today.month, today.day, 23, 0, 0),
        endTime,
        const Color.fromARGB(255, 250, 180, 93),
        false));
    return meetings;
  }

  // Change calendar background to specified season
  void changebg(String s) {
    // Update only if new season is different
    if (season != s) {
      // Important to delay to prevent re updating state while building
      Future.delayed(
          Duration.zero,
          () => setState(() {
                season = s;
              }));
    }
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
