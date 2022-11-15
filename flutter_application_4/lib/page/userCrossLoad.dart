import 'package:flutter/material.dart';
import 'package:flutter_application_4/page/audiopage.dart';
import 'package:flutter_application_4/page/google_map.dart';
import 'package:flutter_application_4/page/login.dart';
import 'package:flutter_application_4/page/todoListpage.dart';
import 'package:flutter_application_4/page/todopage.dart';
import 'package:flutter_application_4/provider/audioProvider.dart';
import 'package:flutter_application_4/provider/loginProvider.dart';
import 'package:provider/provider.dart';

class FnListPage extends StatefulWidget {
  const FnListPage({super.key});

  @override
  State<FnListPage> createState() => _FnListPageState();
}

class _FnListPageState extends State<FnListPage> {
  final List _contentList = [
    const ToDoList(),
    ChangeNotifierProvider(
      create: (context) => AudioProvider(),
      child: const AudioPage(),
    ),
    const GoogleMapPage(),
  ];
  int _tapNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상태 관리하면서 제작'),
      ),
      drawer: const NavDrawer(),
      body: _contentList.elementAt(_tapNum),
      floatingActionButton: _tapNum == 0
          ? FloatingActionButton.small(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoListWrite(true, 0)),
              ),
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _tapNum = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.audio_file), label: 'Audio'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Map'),
        ],
        currentIndex: _tapNum,
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserStateProvider userStateProvider =
        Provider.of<UserStateProvider>(context, listen: false);
    String userName = userStateProvider.getUserName;
    void logout() {
      userStateProvider.logout();
    }

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text('NickName: $userName'),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ),
              );
            },
            leading: const Icon(Icons.logout),
            title: const Text('로그아웃'),
          )
        ],
      ),
    );
  }
}
