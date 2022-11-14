import 'package:flutter/material.dart';
import 'package:flutter_application_4/widget/google_map_widget.dart';

class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GoogleMapWidget();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('구글 지도'),
    //   ),
    //   body: const GoogleMapWidget(),
    // );
  }
}
