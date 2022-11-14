import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/todomodel.dart';
import 'package:flutter_application_4/page/todoListpage.dart';
import 'package:flutter_application_4/provider/todoListProvider.dart';
import 'package:flutter_application_4/repository/todoListRepository.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  TodoListProvider _todoListProvider = TodoListProvider();

  @override
  void initState() {
    super.initState();
    _todoListInit();
  }

  void _todoListInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<TodoListProvider>(context, listen: false)
          .todoListInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    _todoListProvider = Provider.of<TodoListProvider>(context);
    List<TodoModel> todoList = _todoListProvider.todoListGetAllItem;
    int total = _todoListProvider.todoListGetTotal;

    void todoItemCreate() {
      // _todoListProvider.todoItemCreate();
    }

    void todoItemDelete(int id) {
      _todoListProvider.deleteTodoItem(id);
    }

    print(todoList);

    return ListView.builder(
      itemCount: total,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TodoListWrite(false, todoList[index].no),
                      ),
                    ),
                    child: Text(todoList[index].title),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        todoItemDelete(todoList[index].no);
                        print('삭제');
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              height: 20,
              color: Colors.black,
            )
          ],
        );
      },
    );
  }
}
