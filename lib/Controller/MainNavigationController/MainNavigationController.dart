import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../view/Streak/Streak.dart';
import '../../view/home/Home.dart';
import '../../view/subject_video/video_subjects.dart';

class MainNavigationController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomePage(),
    VideoDetailsPage(),
    StreakPage(),
    const Center(child: Text("Profile Page")),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}