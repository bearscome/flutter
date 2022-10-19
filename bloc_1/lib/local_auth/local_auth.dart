import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class LocalAuth extends StatefulWidget {
  const LocalAuth({super.key});
  final PageTitle = 'LocalAuth';

  @override
  State<LocalAuth> createState() => _LocalAuthState();
}

class _LocalAuthState extends State<LocalAuth> {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('local_auth'),
      ),
      body: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final LocalAuthentication auth = LocalAuthentication();
  late List<BiometricType> canUseAuth = [];

  @override
  void initState() {
    super.initState();
    canUseLocalAuth();
  }

  Future<void> canUseLocalAuth() async {
    bool localAuthState = await auth.canCheckBiometrics;
    // 생체 인식을 지원하는 디바이스인지 체크
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    // 사용 가능한 생체인식 배열

    debugPrint('$localAuthState');
    debugPrint('$availableBiometrics');

    if (availableBiometrics.isEmpty) {
      // 사용 가능한 것이 없을 때
    }

    canUseAuth = availableBiometrics;

    /**
     * weak: 패턴, pin번호 기본 인증인 듯
     * strong: 지문
     */
    if (availableBiometrics.contains(BiometricType.fingerprint)) {
      // 지문 인식
    } else if (availableBiometrics.contains(BiometricType.face)) {
      // 얼굴인식이 가능할 경우
    }
  }

  Future<void> usePingerAuth() async {
    debugPrint('canUseAuth: $canUseAuth');
    if (canUseAuth.isNotEmpty) {
      bool canActive = await auth.authenticate(
        localizedReason: '지문 인식 해줘',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );

      if (canActive) {
        showSnackBar('인증이 완료되었습니다.');
      } else {
        showSnackBar('인증을 실패했습니다.');
      }
    } else {
      showSnackBar('패턴, 지문등(인증)을 설정해 주세요');
    }
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        debugPrint('암호 인증 종류');
        usePingerAuth();
      },
      child: const Text('인증 종류'),
    );
  }
}
