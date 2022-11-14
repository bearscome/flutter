import 'package:flutter/material.dart';
import 'package:flutter_blocpattern/count_bloc_p/count_bloc/count_bloc.dart';
import 'package:flutter_blocpattern/count_bloc_p/count_components/count_view.dart';

late CountBloc countBloc;

class BlocDisplayWidget extends StatefulWidget {
  const BlocDisplayWidget({super.key});

  @override
  State<BlocDisplayWidget> createState() => _BlocDisplayWidgetState();
}

class _BlocDisplayWidgetState extends State<BlocDisplayWidget> {
  @override
  void initState() {
    super.initState();
    countBloc = CountBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countBloc.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CountView(),
      floatingActionButton: Row(
        children: [
          IconButton(
            onPressed: () {
              countBloc.addCount();
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              countBloc.removeCount();
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
