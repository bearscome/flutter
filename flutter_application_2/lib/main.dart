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
      body: Builder(builder: (context) {
        return ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('하이'),
            ));
          },
          child: const Text(
            "SHOW ME",
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        );
      }),
    );
  }
}
