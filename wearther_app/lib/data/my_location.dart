import 'package:geolocator/geolocator.dart';

class Mylocation {
  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print('위도: $latitude2, 경도: $longitude2');
    } catch (e) {
      print('네트워크가 연결이 안되어 있습니다.');
    }
  }
}
