import 'package:get/get.dart';
import 'package:project_mate/views/Calendar/calendar.dart';
import 'package:project_mate/views/Groups/groups.dart';
import 'package:project_mate/views/Home/home.dart';
import 'package:project_mate/views/Storage/storage.dart';
import 'package:project_mate/views/Todo/todo.dart';

class BottomNavBarController extends GetxController {
  var currentIndex = 0.obs;
  var pages = [
    const Home(),
    const Todo(),
    const Groups(),
    const Storage(),
    const Calendar(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
