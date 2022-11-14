class TodoModel {
  final int no;
  final String title;
  final String content;
  final String recordDate;

  TodoModel({
    required this.no,
    required this.title,
    required this.content,
    required this.recordDate,
  });

  factory TodoModel.fromJson(Map<String, dynamic> jsonData) {
    return TodoModel(
      no: jsonData['no'],
      title: jsonData['title'],
      content: jsonData['content'],
      recordDate: jsonData['recordDate'],
    );
  }
}
