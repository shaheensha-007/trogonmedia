import 'package:flutter/material.dart';
import '../../Model/Home_Model/HomeModel.dart';

class ActiveCourseCard extends StatelessWidget {
  final ActiveCourse course;
  const ActiveCourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF283593),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircularProgressIndicator(
            value: (course.progress ?? 0) / 100,
            color: Colors.orange,
            backgroundColor: Colors.white24,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.title!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("${course.testsCompleted}/${course.totalTests} Tests Completed",
                    style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Continue >>>>", style: TextStyle(color: Colors.cyanAccent)),
          )
        ],
      ),
    );
  }
}