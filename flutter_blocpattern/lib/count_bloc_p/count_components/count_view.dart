import 'package:flutter/material.dart';
import 'package:flutter_blocpattern/count_bloc_p/count_ui/bloc_display_widget.dart';

class CountView extends StatelessWidget {
  CountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        // 비동기 처리(StreamBuilder: 변화되는 값을 계속 감지)
        stream: countBloc.stream,
        // StreamBuilder를 통해 countBloc.count를 감지
        initialData: 0,
        builder: (context, snapshot) {
          // AsyncSnapShot을 통해 들어온 snapshot을 UI에 뿌려준다.
          if (snapshot.hasData) {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 30),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
