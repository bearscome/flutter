import 'package:flutter/material.dart';
import 'package:wearther_app/screens/weather_screen.dart';
import '../data/my_location.dart';
import '../data/network.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latitude3;
  late double longitude3;
  final String apiKey = '87daf96918fe95de1b0a4ca2cdc418fb';

  @override
  void initState() {
    super.initState();

    _getLocation();
  }

  void _getLocation() async {
    Mylocation mylocation = Mylocation();
    await mylocation.getMyCurrentLocation();
    latitude3 = mylocation.latitude2;
    longitude3 = mylocation.longitude2;
    print('$latitude3, $longitude3');

    Network network = Network(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&units=metric&appid=$apiKey',
      'https://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apiKey',
    );
    var weatherData = await network.getJsonData();
    var airData = await network.getAirData();
    print('weatherData: $weatherData, airData: $airData');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => WeartherScreen(
          parseWeatherData: weatherData,
          parseAirPollution: airData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '로딩중 입니다.',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
