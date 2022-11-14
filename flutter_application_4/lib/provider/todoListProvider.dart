import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/todomodel.dart';
import 'package:flutter_application_4/repository/todoListRepository.dart';

class TodoListProvider extends ChangeNotifier {
  TodoListRepository _todoListRepository = TodoListRepository();
  List<TodoModel> _todoList = [];
  int _todoTotal = 0;

  List<TodoModel> get todoListGetAllItem => _todoList;
  int get todoListGetTotal => _todoTotal;

  Future<void> todoListInit() async {
    await _todoListRepository.database;
    List list = await _todoListRepository.getAllData();

    List<TodoModel> todoItems = list.map((e) {
      return TodoModel(
        no: e['no'],
        title: e['title'],
        content: e['content'],
        recordDate: e['recordDate'],
      );
    }).toList();

    _todoTotal = list.length;
    _todoList = todoItems;

    notifyListeners();
  }

  Future<void> todoItemCreate(
      String title, String content, String recordData) async {
    await _todoListRepository.createItem(
      title: title,
      content: content,
      recordDate: DateTime.now().toString(),
    );
    todoListInit();
    notifyListeners();
  }

  Future<void> todoItemUpdate(int no, String title, String content) async {
    await _todoListRepository.updateItem(
      no: no,
      title: title,
      content: content,
    );
    todoListInit();
    notifyListeners();
  }

  Future<void> deleteTodoItem(int id) async {
    print('deleteTodoItem id ${id}');
    await _todoListRepository.deleteItem(id);
    todoListInit();
    notifyListeners();
  }

  // Future<TodoModel> readItem(int id) async {
  // List<Map<String, dynamic>> getData = await _todoListRepository.readItem(id);
  // TodoModel data = TodoModel(
  //   no: getData[0]["no"],
  //   title: getData[0]['title'],
  //   content: getData[0]["content"],
  //   recordDate: getData[0]["recordDate"],
  // );
  // }
}
