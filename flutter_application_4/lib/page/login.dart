import 'package:flutter/material.dart';
import 'package:flutter_application_4/page/userCrossLoad.dart';
import 'package:flutter_application_4/provider/loginProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';

  submit() {
    Map<String, dynamic> result =
        Provider.of<UserStateProvider>(context, listen: false)
            .login(username: _username, password: _password);
    debugPrint('result: ${result['status']}');

    if (result['status']) {
      debugPrint('로그인 성공');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const FnListPage(),
        ),
      );
    } else {
      debugPrint('로그인 실패');
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: const Text("로그인 실패"),
            content: Text(result['msg']),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('닫기'),
              ),
            ],
          );
        },
      );
    }
  }

  // TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: GestureDetector(
        onTap: () {
          debugPrint('ontap');
        },
        child: SingleChildScrollView(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Column(
              children: [
                TextField(
                  // controller: _userIdController,
                  onChanged: (value) => setState(
                    () {
                      _username = value;
                    },
                  ),
                ),
                TextField(
                  // controller: _passwordController,
                  onChanged: (value) => setState(
                    () {
                      _password = value;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    submit();
                  },
                  child: const Text('로그인'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
