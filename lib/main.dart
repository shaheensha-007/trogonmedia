import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogonmedia/view/onbording_screen/onbording%20screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: OnboardingScreen(),
    );
  }
}

