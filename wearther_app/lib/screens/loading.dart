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
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&units=metric&appid=$apiKey');
    var weatherData = await network.getJsonData();
    print(weatherData);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => WeartherScreen(
          parseWeatherData: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Get my location'),
        ),
      ),
    );
  }
}
