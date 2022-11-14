import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/todomodel.dart';
import 'package:flutter_application_4/provider/todoListProvider.dart';
// import 'package:path/path.dart';
import 'package:provider/provider.dart';

class TodoListWrite extends StatefulWidget {
  bool initialState = true;
  int id;

  TodoListWrite(this.initialState, this.id, {super.key});

  @override
  State<TodoListWrite> createState() => _TodoListWriteState();
}

class _TodoListWriteState extends State<TodoListWrite> {
  TodoModel? item;
  late int no = 0;
  late String title = '';
  late String content = '';
  late TextEditingController _titleTextEditingController;
  late TextEditingController _contentTextEditingController;

  late TodoListProvider _todoListProvider;
  final Map<String, String> errMsg = {
    "titleIsEmpty": '제목에 내용이 없어요',
    "contentIsEmpty": "본문에 내용이 없어요",
    "allIsEmpty": "제목 및 본문에 내용이 없어요",
    "errbody": "한 번 확인해 보세요."
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleTextEditingController = TextEditingController();
    _contentTextEditingController = TextEditingController();
    debugPrint('widget, ${widget.id}');
    if (!widget.initialState) {
      modifyInit(widget.id);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleTextEditingController.dispose();
    _contentTextEditingController.dispose();
  }

  void modifyInit(int id) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // List<TodoModel> data =
      //     Provider.of<TodoListProvider>(context, listen: false)
      //         // .readItem(id);
      //         .todoListGetAllItem();

      // title = data.title;
      // content = data.content;

      List<TodoModel> itemList =
          Provider.of<TodoListProvider>(context, listen: false)
              .todoListGetAllItem;
      int getItemIndex = itemList.indexWhere((element) => element.no == id);
      TodoModel getItem = itemList[getItemIndex];
      item = getItem;

      _titleTextEditingController.text = getItem.title;
      _contentTextEditingController.text = getItem.content;
      no = getItem.no;
      title = getItem.title;
      content = getItem.content;

      debugPrint('----------------------');
      debugPrint(_titleTextEditingController.value.text);
      debugPrint(_titleTextEditingController.text);
      debugPrint('----------------------');

      debugPrint(
          'title: $title, content: $content getItem, ${getItem.recordDate}');
    });
  }

  @override
  Widget build(BuildContext context) {
    _todoListProvider = Provider.of<TodoListProvider>(context);

    debugPrint(
        'asdasdas $title, asdsadas $content, asdasdas ${item?.recordDate}');

    void submit() async {
      if (title.isNotEmpty && content.isNotEmpty) {
        if (widget.initialState) {
          await _todoListProvider.todoItemCreate(
            title,
            content,
            DateTime.now().toString(),
          );
        } else {
          await _todoListProvider.todoItemUpdate(
            no,
            title,
            content,
          );
        }
        if (mounted) {
          Navigator.pop(context);
        }
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: title.isNotEmpty
                  ? Text(errMsg['titleIsEmpty'].toString())
                  : content.isNotEmpty
                      ? Text(errMsg['contentIsEmpty'].toString())
                      : Text(errMsg['allIsEmpty'].toString()),
              content: Text(errMsg['errbody'].toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('닫기'),
                )
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('투두리스트 작성'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 50,
                color: Colors.red,
                child: Row(
                  children: [
                    const Text('타이틀'),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) => title = value,
                        controller: _titleTextEditingController,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.green,
                height: 300,
                child: Row(
                  children: [
                    const Text('본문'),
                    Expanded(
                      child: TextFormField(
                        controller: _contentTextEditingController,
                        onChanged: (value) => content = value,
                        maxLines: 30,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text(!widget.initialState ? '수정하기' : "작성하기"),
                onPressed: () => submit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
