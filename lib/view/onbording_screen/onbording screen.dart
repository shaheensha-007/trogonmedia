import 'package:flutter/material.dart';
import '../../Model/onbording_model/onbordingModel.dart';
import '../Main_Navigation/Main_Navigation.dart';
import 'OnboardingBody.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _goToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) =>  MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingPages.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                return OnboardingBody(item: onboardingPages[index]);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // NEXT BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentIndex == onboardingPages.length - 1) {
                        _goToHome();
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00ACC1),
                      shape: StadiumBorder(),
                    ),
                    child: const Text("Next", style: TextStyle(color: Colors.white)),
                  ),
                ),
                TextButton(
                  onPressed: _goToHome,
                  child: const Text("Skip", style: TextStyle(color: Color(0xFF00ACC1))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}