import 'package:flutter/material.dart';
import 'package:flutter_application_4/page/login.dart';
import 'package:flutter_application_4/page/userCrossLoad.dart';
import 'package:flutter_application_4/provider/loginProvider.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var userStatus = Provider.of<UserStateProvider>(context);
    var loginStaus = userStatus.getLoginStatus;
    debugPrint('loginStaus $loginStaus');

    return loginStaus ? const FnListPage() : const LoginPage();
  }
}
