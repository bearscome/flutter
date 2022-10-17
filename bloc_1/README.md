# Aos, Ios Api from lib
## 사진 관련
 - 카메라 접근
    image_picker: 이미지 라이브러리에서 이미지를 선택하고 카메라로 새 사진을 찍기 위한 iOS, Android용 Flutter 플러그인이다.
        URL: https://pub.dev/packages/image_picker

        권한설정
        iOS /ios/Runner/Info.plist
         - NSPhotoLibraryUsageDescription: 앱에 사진 라이브러리에 대한 권한이 필요한 이유를 설명합니다. 이를 비주얼 편집기에서 Privacy - Photo Library Usage Description 이라고 합니다.
         - NSCameraUsageDescription: 앱이 카메라에 액세스해야 하는 이유를 설명합니다. 이를 비주얼 편집기에서 Privacy - Camera Usage Description 이라고 합니다.
         - NSMicrophoneUsageDescription: 동영상을 녹화하려는 경우 앱에서 마이크에 액세스해야 하는 이유를 설명합니다. 이를 비주얼 편집기에서 개인 정보 - 마이크 사용 설명 이라고 합니다.
        <key>NSPhotoLibraryUsageDescription</key>
        <string>ios Camera<string> ...
        Android는 자동으로 해준다.
        
    gallery_saver: 네트워크 또는 임시 파일의 이미지 및 비디오를 외부 저장소에 저장합니다. 이미지와 비디오는 모두 Android 갤러리와 iOS 사진에서 볼 수 있습니다. - 참고: 네트워크 이미지 또는 비디오 링크를 저장하려면 'http/ https' 접두사를 포함해야 합니다.
        URL: https://pub.dev/packages/gallery_saver
        
        권한설정
        iOS: /ios/Runner/Info.plist
         - NSPhotoLibraryUsageDescription: 
        Android: /android/app/src/main/AndroidManifest.xml
         - android.permission.WRITE_EXTERNAL_STORAGE: 외부 저장소 사용 권한
 - GPS 접근
    geolocator: 플랫폼별 위치 서비스(FusedLocationProviderClient 또는 사용할 수 없는 Android의 LocationManager 및 iOS의 CLLocationManager)에 대한 쉬운 액세스를 제공하는 Flutter 지리적 위치 플러그인이다.
        URL: https://pub.dev/packages/geolocator

        권한설정
        iOS: /ios/Runner/Info.plist
         - <key>NSLocationWhenInUseUsageDescription</key>
         - <string>This app needs access to location when open.</string>
         - <key>NSLocationAlwaysUsageDescription</key>
         - <string>This app needs access to location when in the background.</string>
        Android: /android/app/src/main/AndroidManifest.xml
         - <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
         - <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
        
 
# bloc_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
