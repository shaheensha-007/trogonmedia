import 'package:flutter/material.dart';
import '../../Model/Home_Model/HomeModel.dart';

class LiveSessionBanner extends StatelessWidget {
  final LiveSession session;

  const LiveSessionBanner({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.orange.shade50, Colors.white]),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.orange.shade100),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "● Live",
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
                Text(
                  session.title ?? "Live Session",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${session.instructor?.name ?? 'Instructor'} | ${session.sessionDetails?.time ?? ''}",
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              side: const BorderSide(color: Colors.orange),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              session.action ?? "Join",
              style: const TextStyle(color: Colors.orange),
            ),
          )
        ],
      ),
    );
  }
}