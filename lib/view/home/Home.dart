import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Home_controller/HomeController.dart';
import 'ActiveCourseCard.dart';
import 'CommunityCard.dart';
import 'HeroBannerSlider.dart';
import 'Homeheader.dart';
import 'LiveSessionBanner.dart';
import 'PopularCoursesList.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.homeData == null) {
          return const Center(child: Text("No data available"));
        }

        final data = controller.homeData!;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(user: data.user!),
              HeroBannerSlider(banners: data.heroBanners!),
              ActiveCourseCard(course: data.activeCourse!),
              PopularCoursesList(popular: data.popularCourses!),
              LiveSessionBanner(session: data.liveSession!),
              CommunityCard(community: data.community!),
              const SizedBox(height: 30),
            ],
          ),
        );
      }),
    );
  }
}