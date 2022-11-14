class AudioModelItem {
  String title;
  String url;
  String cover;

  AudioModelItem({required this.title, required this.url, required this.cover});

  factory AudioModelItem.fromJson(Map<String, dynamic> jsonData) {
    return AudioModelItem(
      title: jsonData["title"],
      url: jsonData["url"],
      cover: jsonData["cover"],
    );
  }
}
