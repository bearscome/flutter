import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GetGps extends StatefulWidget {
  const GetGps({super.key});
  final PageTitle = 'Gps';

  @override
  State<GetGps> createState() => _GetGpsState();
}

class _GetGpsState extends State<GetGps> {
  var positionInfo;
  void showSnackBar(String err) {
    final snackBar = SnackBar(
      content: Text(err.toString()),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> getGps(BuildContext context) async {
    late bool serviceEnabled;
    LocationPermission permission;
    // 현재 위치
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    debugPrint('$serviceEnabled');

    permission = await Geolocator.checkPermission();
    debugPrint('$permission');
    if (!serviceEnabled) {
      showSnackBar('위치 정보 서비스가 비활성화 되었습니다.');
    }

    if (permission == LocationPermission.denied) {
      // 위치정보 접근 불가
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showSnackBar('위치 정보 권환이 거부되었습니다.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // 위치정보 권한 영구적 거부
      showSnackBar('위치정보 권한이 영구적으로 거부되었습니다. 권한을 변경해주세요.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    debugPrint('위치: $position');
    setState(() {
      positionInfo = position;
    });

    /**
     * 마지막 위치
     * Position? position = await Geolocator.getLastKnownPosition();
     */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.PageTitle),
      ),
      body: Column(
        children: [
          const Text('GPS 정보'),
          Text('${positionInfo}'),
          TextButton(
              onPressed: () async {
                await Geolocator.checkPermission();
                await getGps(context);
              },
              child: const Text('get Gps Info'))
        ],
      ),
    );
  }
}
