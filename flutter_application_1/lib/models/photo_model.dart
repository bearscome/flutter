class Album {
  late int albumId;
  late int id;
  late String title;
  late String url;
  late String thumbnailUrl;

  Album({
    required this.id,
    required this.title,
    required this.albumId,
    required this.thumbnailUrl,
    required this.url,
  });

  Album.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    thumbnailUrl = json['thumbnailUrl'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = url;
    data['id'] = id;
    data['title'] = title;
    data['albumId'] = albumId;
    data['thumbnailUrl'] = thumbnailUrl;

    return data;
  }
}
