import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../Controller/Streak_Controller/StreakController.dart';
import '../../Model/StreakModel/Streak_Model.dart';

class StreakPage extends StatelessWidget {
  final controller = Get.put(StreakController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF80DEEA),
      appBar: AppBar(
        title: const Text("Learning Streak"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final days = controller.streakData.value?.days ?? [];

        return Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              itemCount: days.length,
              itemBuilder: (context, index) {
                final day = days[index];
                Alignment alignment = index % 2 == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight;

                return Align(
                  alignment: alignment,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (day.isCurrent) _buildTopicTooltip(day),
                        _buildDayNode(day.dayNumber, day.isCompleted, day.isCurrent),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      }),
    );
  }

  Widget _buildDayNode(int dayNum, bool isCompleted, bool isCurrent) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF00ACC1),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
        border: Border.all(color: Colors.white.withOpacity(0.5), width: 4),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Day", style: TextStyle(color: Colors.white, fontSize: 10)),
            Text("$dayNum", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicTooltip(StreakDay day) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF00ACC1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Today's Topic",
              style: TextStyle(color: Colors.white70, fontSize: 10)),
          Text(day.topicTitle,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          const Divider(color: Colors.white24, height: 15),
          // Dynamically list all modules from the JSON
          ...day.modules.map((module) => Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text("• ${module.name}",
                style: const TextStyle(color: Colors.white, fontSize: 11)),
          )).toList(),
        ],
      ),
    );
  }
}