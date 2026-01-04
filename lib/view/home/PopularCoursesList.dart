import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Home_controller/HomeController.dart';
import '../../Model/Home_Model/HomeModel.dart';

class PopularCoursesList extends StatelessWidget {
  final List<PopularCourses> popular;
  final HomeController controller = Get.find<HomeController>();

  PopularCoursesList({super.key, required this.popular});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Obx(() {
            int currentIndex = controller.selectedCategoryIndex.value;

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: popular.length,
              itemBuilder: (context, index) {
                bool isSelected = currentIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ChoiceChip(
                    label: Text(popular[index].name ?? ""),
                    selected: isSelected,
                    selectedColor: const Color(0xFF00ACC1),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    onSelected: (bool selected) {
                      if (selected) controller.updateCategoryIndex(index);
                    },
                  ),
                );
              },
            );
          }),
        ),

        const SizedBox(height: 10),

        Obx(() {
          final selectedIndex = controller.selectedCategoryIndex.value;
          if (popular.isEmpty || selectedIndex >= popular.length) {
            return const SizedBox.shrink();
          }

          final courses = popular[selectedIndex].courses ?? [];

          if (courses.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("No courses available in this category"),
            );
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
            ),
            shrinkWrap: true,
            padding: const EdgeInsets.all(15),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courses.length,
            itemBuilder: (context, index) => _buildCourseCard(courses[index]),
          );
        }),
      ],
    );
  }

  Widget _buildCourseCard(Courses course) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                course.image ?? "",
                width: double.infinity,
                fit: BoxFit.cover,
                // This placeholder shows if the URL is broken or blocked
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.broken_image, color: Colors.grey, size: 40),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  course.title ?? "No Title",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00ACC1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(course.action ?? "Explore", style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}