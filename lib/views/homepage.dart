import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_mate/controllers/bottomnavbarcontroller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => controller.pages[controller.currentIndex.value],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.h,
        padding: EdgeInsets.only(bottom: 0.0125.sh, right: 0.01.sw),
        margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw, bottom: 0.03.sh),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 8,
            offset: const Offset(0, 0),
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(10.dg)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 0.07.sh,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: 0.05.sh,
                      width: 0.12.sw,
                      child: IconButton(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        splashRadius: 1,
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        enableFeedback: false,
                        onPressed: () {
                          controller.changeIndex(0);
                        },
                        icon: Icon(
                          LineIcons.home,
                          color: Colors.grey[600],
                          size: 28.sp,
                        ),
                      ),
                    ),
                    controller.currentIndex.value == 0
                        ? Container(
                            alignment: Alignment.bottomCenter,
                            height: 0.01.sh,
                            width: 0.05.sw,
                            decoration: BoxDecoration(
                                color: const Color(0xff15FFFF),
                                borderRadius: BorderRadius.circular(10.dg),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff15FFFF)
                                        .withOpacity(0.4),
                                    blurRadius: 4,
                                    spreadRadius: 3,
                                    offset: const Offset(0, -4),
                                  )
                                ]))
                        : Container()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0.07.sh,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: 0.05.sh,
                      width: 0.12.sw,
                      child: IconButton(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        splashRadius: 1,
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        enableFeedback: false,
                        onPressed: () {
                          controller.changeIndex(1);
                        },
                        icon: Icon(
                          Icons.format_list_bulleted_add,
                          color: Colors.grey[600],
                          size: 28.sp,
                        ),
                      ),
                    ),
                    controller.currentIndex.value == 1
                        ? Container(
                            alignment: Alignment.bottomCenter,
                            height: 0.01.sh,
                            width: 0.05.sw,
                            decoration: BoxDecoration(
                                color: const Color(0xff15FFFF),
                                borderRadius: BorderRadius.circular(10.dg),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff15FFFF)
                                        .withOpacity(0.4),
                                    blurRadius: 4,
                                    spreadRadius: 3,
                                    offset: const Offset(0, -4),
                                  )
                                ]))
                        : Container()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0.07.sh,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: 0.05.sh,
                      width: 0.12.sw,
                      child: IconButton(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        splashRadius: 1,
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.zero,
                        enableFeedback: false,
                        onPressed: () {
                          controller.changeIndex(2);
                        },
                        icon: Icon(
                          Icons.group_outlined,
                          color: Colors.grey[600],
                          size: 30.sp,
                        ),
                      ),
                    ),
                    controller.currentIndex.value == 2
                        ? Container(
                            alignment: Alignment.bottomCenter,
                            height: 0.01.sh,
                            width: 0.05.sw,
                            decoration: BoxDecoration(
                                color: const Color(0xff15FFFF),
                                borderRadius: BorderRadius.circular(10.dg),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff15FFFF)
                                        .withOpacity(0.4),
                                    blurRadius: 4,
                                    spreadRadius: 3,
                                    offset: const Offset(0, -4),
                                  )
                                ]))
                        : Container()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0.07.sh,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: 0.05.sh,
                      width: 0.12.sw,
                      child: IconButton(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        splashRadius: 1,
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        enableFeedback: false,
                        onPressed: () {
                          controller.changeIndex(3);
                        },
                        icon: Icon(
                          LineIcons.file,
                          color: Colors.grey[600],
                          size: 28.sp,
                        ),
                      ),
                    ),
                    controller.currentIndex.value == 3
                        ? Container(
                            alignment: Alignment.bottomCenter,
                            height: 0.01.sh,
                            width: 0.05.sw,
                            decoration: BoxDecoration(
                                color: const Color(0xff15FFFF),
                                borderRadius: BorderRadius.circular(10.dg),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff15FFFF)
                                        .withOpacity(0.4),
                                    blurRadius: 4,
                                    spreadRadius: 3,
                                    offset: const Offset(0, -4),
                                  )
                                ]))
                        : Container()
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 1),
              // color: Colors.lime,
              height: 0.07.sh,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.changeIndex(4);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 0.05.sh,
                        width: 0.12.sw,
                        decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius: BorderRadius.circular(6.dg)),
                        child: Text(
                          DateTime.now().day.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    controller.currentIndex.value == 4
                        ? Container(
                            alignment: Alignment.bottomCenter,
                            height: 0.01.sh,
                            width: 0.05.sw,
                            decoration: BoxDecoration(
                                color: const Color(0xff15FFFF),
                                borderRadius: BorderRadius.circular(10.dg),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff15FFFF)
                                        .withOpacity(0.4),
                                    blurRadius: 4,
                                    spreadRadius: 3,
                                    offset: const Offset(0, -4),
                                  )
                                ]))
                        : Container()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
