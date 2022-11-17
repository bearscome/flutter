import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constants.dart';
import 'package:flutter_application_4/page/login.dart';
import 'package:flutter_application_4/page/todoListpage.dart';
import 'package:flutter_application_4/provider/loginProvider.dart';
import 'package:provider/provider.dart';

class FnListPage extends StatefulWidget {
  const FnListPage({super.key});

  @override
  State<FnListPage> createState() => _FnListPageState();
}

class _FnListPageState extends State<FnListPage> {
  int _tapNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상태 관리하면서 제작'),
      ),
      drawer: const NavDrawer(),
      body: route.elementAt(_tapNum)["page"],
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
        items: [...(route.map((e) => e["button"]))],
        currentIndex: _tapNum,
        type: BottomNavigationBarType.fixed,
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
              userStateProvider.logout();
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
