import 'package:bloc_1/sqlite/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SQLite extends StatefulWidget {
  const SQLite({super.key});
  final PageTitle = 'SQLite';

  @override
  State<SQLite> createState() => _SQLiteState();
}

class _SQLiteState extends State<SQLite> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sqlInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLITE'),
      ),
      body: Center(),
    );
  }
}
