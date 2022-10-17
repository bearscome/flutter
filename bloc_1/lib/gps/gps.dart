import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GetGps extends StatefulWidget {
  const GetGps({super.key});
  final PageTitle = 'Gps';

  @override
  State<GetGps> createState() => _GetGpsState();
}

class _GetGpsState extends State<GetGps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.PageTitle),
      ),
      body: Container(),
    );
  }
}
