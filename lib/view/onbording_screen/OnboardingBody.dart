import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/onbording_model/onbordingModel.dart';

class OnboardingBody extends StatelessWidget {
  final OnboardingItem item;
  const OnboardingBody({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF00ACC1),
              borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(200, 100)),
            ),
            child: Center(child: Image.asset(item.image)),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Text(
                  item.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}