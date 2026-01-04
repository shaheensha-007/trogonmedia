import 'package:flutter/material.dart';
import '../../Model/Home_Model/HomeModel.dart';

class CommunityCard extends StatelessWidget {
  final Community community;

  const CommunityCard({Key? key, required this.community}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF00ACC1),
              child: Icon(Icons.groups, color: Colors.white),
            ),
            title: Text(
              community.name ?? "Community",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("${community.activeMembers ?? 0} active members"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              community.description ?? "",
              style: const TextStyle(color: Colors.grey, height: 1.4),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF00ACC1)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                community.action ?? "Join Community",
                style: const TextStyle(color: Color(0xFF00ACC1), fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}