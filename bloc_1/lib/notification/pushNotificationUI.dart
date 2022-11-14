import 'package:flutter/material.dart';

class PushNotificationUi extends StatefulWidget {
  const PushNotificationUi({super.key});
  final PageTitle = '푸쉬메세지 확인';

  @override
  State<PushNotificationUi> createState() => _PushNotificationUiState();
}

class _PushNotificationUiState extends State<PushNotificationUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
