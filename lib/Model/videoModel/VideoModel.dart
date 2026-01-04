class VideoModel {
  final String? mainTitle;
  final List<VideoItem> videoList;

  VideoModel({this.mainTitle, required this.videoList});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    var list = json['videos']['videos'] as List;
    return VideoModel(
      mainTitle: json['videos']['title'],
      videoList: list.map((i) => VideoItem.fromJson(i)).toList(),
    );
  }
}

class VideoItem {
  final int id;
  final String title;
  final String description;
  final String status;
  final String videoUrl;

  VideoItem({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.videoUrl
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    return VideoItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      videoUrl: json['video_url'],
    );
  }
}