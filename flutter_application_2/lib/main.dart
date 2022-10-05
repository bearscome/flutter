import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '안녕',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('하이'),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () => print('hi'),
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () => print('안녕'),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  // backgroundImage: AssetImage(''),
                  ),
              accountName: Text('accountName'),
              accountEmail: Text('accountEmail'),
              onDetailsPressed: () => print('하이'),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.media_bluetooth_off),
              title: Text('home'),
              onTap: () => print('hi'),
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: MySnackBar(),
    );
  }
}

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});
  /*
    Scaffold.of() -> MySnackBar에서 부모 위젯은 MyHomePage의 Scaffold를 찾았다.

  */
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('hi@'),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'hello',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.teal,
              duration: Duration(milliseconds: 500),
            ),
          );
        },
      ),
    );
  }
}
