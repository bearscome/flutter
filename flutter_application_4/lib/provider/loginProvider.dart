import 'package:flutter/material.dart';

class UserStateProvider extends ChangeNotifier {
  List<Map<String, String>> userList = [
    {'username': 'qwe', 'password': 'qwe'},
    {'username': 'q', 'password': 'q'},
  ];
  bool _login = false;
  String _userName = '';
  Map<String, dynamic> statusCode = {
    "true": true,
    "false": false,
    "message": {
      "0": "아이디를 입력해 주세요'",
      "1": "비밀번호 입력해 주세요",
      "2": "회원 정보가 없습니다..",
      "3": "비밀번호를 정확히 입력해 주세요.",
      "4": "성공",
    },
  };

  bool get getLoginStatus => _login;
  String get getUserName => _userName;

  Map<String, dynamic> login({
    required String username,
    required String password,
  }) {
    Map<String, dynamic> status = {
      'status': '',
      'msg': '',
    };

    status['status'] = statusCode["false"];

    if (username.isEmpty) {
      status['msg'] = statusCode["message"]["0"];

      return status;
    }

    if (password.isEmpty) {
      status['msg'] = statusCode["message"]["1"];

      return status;
    }

    for (var element in userList) {
      if (element['username'] != username) {
        status['msg'] = statusCode["message"]["2"];
      }
      if (element['username'] == username && element['password'] != password) {
        status['msg'] = statusCode["message"]["3"];
      }
      if (element['username'] == username && element['password'] == password) {
        status['status'] = statusCode["true"];
        status['msg'] = statusCode["message"]["4"];

        setUserName(username);
      }
    }

    return status;
  }

  void logout() {
    _login = false;
    notifyListeners();
  }

  void setUserName(String value) {
    _userName = value;
    notifyListeners();
  }
}
