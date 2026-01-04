import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:trogonmedia/Model/StreakModel/Streak_Model.dart';

class StreakController extends GetxController {
  var isLoading = true.obs;
  var streakData = Rxn<StreakModel>();
  var selectedDayIndex = (-1).obs;

  @override
  void onInit() {
    fetchStreakData();
    super.onInit();
  }

  Future<void> fetchStreakData() async {
    try {
      isLoading(true);
      var request = http.Request('POST', Uri.parse('${dotenv.env["basepath"]!}streak.php'));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String data = await response.stream.bytesToString();
        streakData.value = StreakModel.fromJson(jsonDecode(data));
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load streak path");
    } finally {
      isLoading(false);
    }
  }

  void toggleTooltip(int index) {
    if (selectedDayIndex.value == index) {
      selectedDayIndex.value = -1; // Hide if clicked again
    } else {
      selectedDayIndex.value = index;
    }
  }
}
