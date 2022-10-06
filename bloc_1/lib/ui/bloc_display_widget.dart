import 'package:bloc_1/bloc/count_bloc.dart';
import 'package:bloc_1/components/count_view.dart';
import 'package:flutter/material.dart';

late CountBloc countBloc // 전역 변수로 CountBloc을 호출하고 late를 통해 나중에 값을 받는다._bloc

class BlocDisplayWidget extends StatefulWidget {
  const BlocDisplayWidget({super.key});

  @override
  _BlocDisplayWidgetState createState() => _BlocDisplayWidgetState();
}

class _BlocDisplayWidgetState extends State<BlocDisplayWidget> {
  @override
  void initState() {
    super.initState();
    countBloc = CountBloc();
  }

  @override
  void dipose() {
    super.dispose();
    countBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc 패턴"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: CountView(),
    )
  }
}