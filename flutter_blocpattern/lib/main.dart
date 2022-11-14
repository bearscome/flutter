import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocpattern/count_bloc_p/count_ui/bloc_display_widget.dart';
import 'package:flutter_blocpattern/count_bloclib_p/count_cubit/count_cubit.dart';
import 'package:flutter_blocpattern/count_bloclib_p/count_observer/counter.observer.dart';
import 'package:flutter_blocpattern/count_bloclib_p/count_ui/count_display_widget.dart';
import 'package:flutter_blocpattern/count_provider_p/count_components/count_view.dart';
import 'package:flutter_blocpattern/count_provider_p/count_provider/count_provider.dart';
import 'package:flutter_blocpattern/count_provider_p/count_ui/count_display_widget.dart';
import 'package:provider/provider.dart';
import 'package:bloc/bloc.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BlocDisplayWidget(),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ChangeNotifierProvider(
//         // ChangeNotifierProvider를 통해 CountProvider 변화에 대해 구독 (하나만 구독 가능)
//         // 여러 개를 구독하기 위해서는 MultiProvider 사용해야 한다.
//         create: (BuildContext context) => CountProvider(),
//         // count_provider.dart
//         child: ProviderDisplayWidget(),
//         // child 하위에 있는 위젯들은 CountProvider에 접근 할 수 있다.
//         // widget단위이긴 한데 Scalfold단위로 받아야 하나 보다.
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const BlocCubitDisplayWidget(),
      ),
    );
  }
}
