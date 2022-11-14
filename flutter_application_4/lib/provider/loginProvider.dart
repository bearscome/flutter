import 'package:flutter/material.dart';

class UserStateProvider extends ChangeNotifier {
  List<Map<String, String>> userList = [
    {'username': 'qwe', 'password': 'qwe'},
    {'username': 'q', 'password': 'q'},
  ];
  bool _login = false;
  String _userName = '';

  bool get getLoginStatus => _login;
  String get getUserName => _userName;

  void changeStatus() {
    _login = true;
    notifyListeners();
  }

  Map<String, dynamic> login(
      {required String username, required String password}) {
    Map<String, dynamic> status = {
      'status': '',
      'msg': '',
    };

    if (username.isEmpty) {
      status['status'] = false;
      status['msg'] = '아이디를 입력해 주세요';

      return status;
    }

    if (password.isEmpty) {
      status['status'] = false;
      status['msg'] = '비밀번호 입력해 주세요';

      return status;
    }

    for (var element in userList) {
      if (element['username'] != username) {
        status['status'] = false;
        status['msg'] = '회원 정보가 없습니다..';
      }
      if (element['username'] == username && element['password'] != password) {
        status['status'] = false;
        status['msg'] = '비밀번호를 정확히 입력해 주세요.';
      }
      if (element['username'] == username && element['password'] == password) {
        status['status'] = true;
        status['msg'] = '성공';

        setUserName(username);
      }
    }

    return status;
  }

  void logout() {
    debugPrint('로그아웃 해봐');
    _login = false;
    notifyListeners();
  }

  void setUserName(String value) {
    _userName = value;
  }
}
