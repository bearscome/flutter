import 'package:flutter/material.dart';
import 'package:flutter_application_1/animal_page.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_application_1/responsive/desktop_body.dart';
import 'package:flutter_application_1/responsive/mobile_body.dart';
import 'package:flutter_application_1/responsive/response.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      home: Mypage(),
    );
  }
}

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        desktopBdoy: DesktopBody(),
        mobileBody: MobileBody(),
      ),
    );
  }
}


// class _MypageState extends State<Mypage> {
//   @override
//   Widget build(BuildContext context) {
//     final currentWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: currentWidth < 600 ? Colors.deepPurple[300] : Colors.red,
//       body: Center(
//         child: Text(
//           currentWidth.toString(),
//         ),
//       ),
//     );
//   }
// }

// class _MypageState extends State<Mypage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple,
//       appBar: AppBar(
//         title: Text('mediaQuery'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text('Wdith: ${MediaQuery.of(context).size.width.toString()}'),
//             Text('height: ${MediaQuery.of(context).size.height.toString()}'),
//             Text(
//               'Aspect Ratio: ${MediaQuery.of(context).size.aspectRatio.toStringAsFixed(2)}',
//             ),
//             Text(
//               'Orientation: ${MediaQuery.of(context).orientation.toString()}',
//               // 가로세로모드?
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
