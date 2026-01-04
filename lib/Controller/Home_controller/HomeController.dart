import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trogonmedia/Model/Home_Model/HomeModel.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  HomeModel? homeData;

  var selectedCategoryIndex = 0.obs;

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  void updateCategoryIndex(int index) {
    selectedCategoryIndex.value = index;
  }

  Future<void> fetchHomeData() async {
    try {
      isLoading(true);
      var response = await http.post(Uri.parse('https://trogon.info/task/api/home.php'));

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        homeData = HomeModel.fromJson(result);
      } else {
        Get.snackbar("Error", "Failed to load data: ${response.reasonPhrase}");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}