import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class WeartherScreen extends StatefulWidget {
  const WeartherScreen({super.key, required this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  State<WeartherScreen> createState() => _WeartherScreenState();
}

class _WeartherScreenState extends State<WeartherScreen> {
  late String cityName;
  late int temp;

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double weatherDataTemp2 = weatherData['main']['temp'];
    int tmep3 = weatherDataTemp2.round();
    var weatherDataCityName = weatherData['name'];

    cityName = weatherDataCityName;
    temp = tmep3;

    debugPrint('$temp, $cityName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Text(
              cityName,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              temp.toString(),
              style: const TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      )),
    );
  }
}
