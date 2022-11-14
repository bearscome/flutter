import 'package:flutter/material.dart';
import 'package:flutter_application_4/api/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late bool status = false;
  late double latitude;
  late double longitude;
  late GoogleMapController mapController;
  final String _markerId = '0';
  final double _zoomValue = 15.0;

  late LatLng _currentPosition;
  final List<Marker> _marker = [];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _getLocationData() async {
    try {
      var getCurrentPosition = await GetLocation().determinePosition();
      latitude = getCurrentPosition.latitude;
      longitude = getCurrentPosition.longitude;
      debugPrint('latitude: $latitude');
      debugPrint('longitude: $longitude');
      _currentPosition =
          LatLng(getCurrentPosition.latitude, getCurrentPosition.longitude);

      _marker.add(
        Marker(
          markerId: MarkerId(_markerId),
          draggable: false,
          onTap: () => debugPrint('makerTap'),
          position: _currentPosition,
        ),
      );

      if (mounted) {
        setState(() {
          status = true;
        });
      }
    } catch (errMsg) {
      debugPrint('에러났엉숑, $errMsg');
      _showDialog(errMsg as Map<String, String>);
    }
  }

  void _showDialog(Map<String, String> errMsg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(errMsg['title'] as String),
          content: Text(errMsg['des'] as String),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('닫기'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return status
        ? GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: _zoomValue,
            ),
            markers: Set.from(_marker),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '로딩 중',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          );
  }
}
