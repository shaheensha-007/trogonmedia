import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import '../../Model/VideoModel/VideoModel.dart'; // Ensure correct path

class VideoController extends GetxController {
  var isLoading = true.obs;
  var videoData = Rxn<VideoModel>();
  var isVideoInitialized = false.obs;

  VideoPlayerController? playerController;

  @override
  void onInit() {
    fetchVideoDetails();
    super.onInit();
  }

  Future<void> fetchVideoDetails() async {
    try {
      isLoading(true);
      var request = http.Request('POST', Uri.parse('https://trogon.info/task/api/video_details.php'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var decodedData = jsonDecode(responseBody);
        videoData.value = VideoModel.fromJson(decodedData);
      } else {
        Get.snackbar("Error", "Server Error: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "Connection failed: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> playVideo(String url) async {
    try {
      isVideoInitialized(false);
      if (playerController != null) {
        await playerController!.dispose();
      }

      playerController = VideoPlayerController.networkUrl(Uri.parse(url));

      await playerController!.initialize();
      await playerController!.play();

      isVideoInitialized(true);
    } catch (e) {
      Get.snackbar("Playback Error", "Could not play this video");
    }
  }


  @override
  void onClose() {
    playerController?.dispose();
    super.onClose();
  }
}