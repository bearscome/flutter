import 'package:geolocator/geolocator.dart';

class GetLocation {
  Future<Position> determinePosition() async {
    /// GPS가 활성화가 되어 있는지 확인
    /// GPS가 활성화가 되어 있다면, 현재 경도 위도 반환
    bool serviceEnabled;
    // GPS가 활성화가 되어 있는지 확인
    LocationPermission permission;
    // 앱에서 GPS의 허용 정도
    Map<String, String> errorMessage = {
      'title': 'GPS 권한 거부',
      'des': '서비스 이용을 위해 해당 권한을 허용으로 변경해 주세요',
    };

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // 위치 서비스가 활성화되었는지 확인하는 함수.

    if (!serviceEnabled) {
      errorMessage['title'] = 'GPS 사용 여부';
      errorMessage['des'] = 'GPS 서비스가 비 활성화 되어 있습니다. ';
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 앱 사용 시 GPS의 권한이 거부되어 GPS를 재 요청 가능
        return Future.error(errorMessage);
        //
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // GPS 권한 영구 거부
      return Future.error(errorMessage);
    }
    return await Geolocator.getCurrentPosition();
    // 장치의 위치에 계속 액세스합니다.
  }
}
