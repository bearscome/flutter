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
## GPS 관련         
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
## 디바이스 인증 관련         
 - 생체 인식
    local_auth: 사용자의 로컬 온 디바이스 인증을 수행함, 지문 또는 얼굴 인식과 같은 
        URL: https://pub.dev/packages/local_auth
        ![오류]오류관련 git: https://gist.github.com/akifarhan/f70a2c777651f2ea61a15eb92a5939c1
            - Add USE_FINGERPRINT permission
            - Change FlutterActivity to FlutterFragmentActivity
    
        권한설정
        iOS: /ios/Runner/Info.plist
         - <key>NSFaceIDUsageDescription</key>
         - <string>Why is my app authenticating using face id?</string>
        Android: /android/app/src/main androidManifest.xml
         - <uses-permission android:name="android.permission.USE_FINGERPRINT"/>
## 알림 겁나 어렵네..          
 - 알림
    flutter_local_notifications: 로컬 알림을 위한 플러그인이다.
    ![오류]// android33, android32L은 현재 오류가 있다. (https://github.com/flutter/flutter/issues/110658)

    권한설정
    iOS: /ios/Runner/AppDelegate.swift
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        }
        iOS는 foreground notification을 지원하지 않도록 설계 됐다. iOS 10 이상 버전에서는 앱이 foreground에 있는 동안 notification이 트리거 될 때의 동작을 제어하기 위해 presentation option을 사용한다. 플러그인의 기본 설정은 app이 foreground에 있을 때 notification이 표시되도록 구성한다

    Android: /android/app/src/main/AndroidManifest.xml
        <activity 
        android:showWhenLocked="true" // 디바이스가 잠겨 있을 때도 알림
        android:turnScreenOn="true" /> // 알림을 눌렀을 때 앱이 켜지는 속성

    Android: /android/app/build.gradle
        compileOptions -> coreLibraryDesugaringEnabled true
        defaultConfig -> multiDexEnabled true
        dependencies
            1. coreLibraryDesugaring 'com.android.tools:desugar_jdk_libs:1.1.5'
            2. implementation "androidx.window:window:1.0.0-rc01"
            3. implementation "androidx.window:window-java:1.0.0-rc01"

## 그냥저냥
 - 제발 plist <string></string> 닫기 태그좀 쓰자
    
        

        
 
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
