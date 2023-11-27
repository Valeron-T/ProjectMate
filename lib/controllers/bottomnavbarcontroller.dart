import 'package:get/get.dart';
import 'package:project_mate/views/Account/account.dart';
import 'package:project_mate/views/Calendar/calendar.dart';
import 'package:project_mate/views/Home/home.dart';

class BottomNavBarController extends GetxController {
  var currentIndex = 0.obs;
  var pages = [
    const Home(),
    const Calendar(),
    const Account(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
