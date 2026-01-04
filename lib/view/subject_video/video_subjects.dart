import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../Controller/videoContoller/videocontoller.dart';

class VideoDetailsPage extends StatelessWidget {
  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(videoController.videoData.value?.mainTitle ?? "Videos")),
      ),
      body: Obx(() {
        if (videoController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final videos = videoController.videoData.value?.videoList ?? [];
        return Column(
          children: [
            Container(
              height: 230,
              width: double.infinity,
              color: Colors.black,
              child: Obx(() {
                if (!videoController.isVideoInitialized.value) {
                  return const Center(
                    child: Icon(Icons.play_circle_fill, color: Colors.white, size: 64),
                  );
                }
                return AspectRatio(
                  aspectRatio: videoController.playerController!.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      VideoPlayer(videoController.playerController!),
                      VideoProgressIndicator(
                        videoController.playerController!,
                        allowScrubbing: true,
                        colors: const VideoProgressColors(playedColor: Colors.teal),
                      ),
                    ],
                  ),
                );
              }),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final video = videos[index];
                  bool isLocked = video.status == "locked";
                  bool isCompleted = video.status == "completed";

                  return ListTile(
                    enabled: !isLocked,
                    leading: CircleAvatar(
                  backgroundColor: isLocked ? Colors.grey[300] : Colors.teal[100],
                    child: Icon(
                      isLocked ? Icons.lock : Icons.play_arrow,
                      color: isLocked ? Colors.grey : Colors.teal,
                    ),
                  ),
                  title: Text(
                  video.title,
                  style: TextStyle(color: isLocked ? Colors.grey : Colors.black),
                  ),
                  subtitle: Text(video.description),
                  trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  // DOWNLOAD BUTTON
                  if (!isLocked)
                  // IconButton(
                  // icon: const Icon(Icons.download_for_offline_outlined),
                  // onPressed: () => videoController.downloadVideo(
                  // video.videoUrl,
                  // video.title
                  // ),
                  // ),
                  if (isCompleted)
                  const Icon(Icons.check_circle, color: Colors.green),
                  ],
                  ),
                  onTap: isLocked
                  ? null
                      : () => videoController.playVideo(video.videoUrl),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}