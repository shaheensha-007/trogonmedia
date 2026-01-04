import 'package:flutter/material.dart';
import '../../Model/Home_Model/HomeModel.dart';

class HomeHeader extends StatelessWidget {
  final User user;
  const HomeHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 40),
      decoration: const BoxDecoration(
        color: Color(0xFF00ACC1),
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(200, 30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(user.greeting ?? "",
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Text("Day ${user.streak?.days} ", style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(user.streak?.icon ?? "🔥"),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
               Icon(Icons.notifications,color: Colors.black,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}