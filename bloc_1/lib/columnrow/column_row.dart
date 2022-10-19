import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class ColumnRow extends StatefulWidget {
  const ColumnRow({super.key});
  final PageTitle = 'ColumnRow';

  @override
  State<ColumnRow> createState() => _ColumnRowState();
}

class _ColumnRowState extends State<ColumnRow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가로세로 본능'),
      ),
      body: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeRight,
                DeviceOrientation.landscapeLeft,
              ]);
            },
            child: const Text('가로고정'),
          ),
          ElevatedButton(
            onPressed: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
            },
            child: const Text('세로고정'),
          ),
          ElevatedButton(
            onPressed: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeRight,
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
            },
            child: const Text('고정 해제'),
          ),
        ],
      ),
    );
  }
}
