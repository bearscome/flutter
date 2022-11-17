import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key});

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  late WebViewController _webViewController;
  bool loading = true;

  Future<bool> backAction(context) {
    Future<bool> future = _webViewController.canGoBack();

    future.then((canGoBack) {
      canGoBack
          ? _webViewController.goBack() // 웹뷰 뒤로가기
          : Platform.isIOS // 히스토리가 없다면 앱 종료
              ? exit(0)
              : SystemNavigator.pop();
    });

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backAction(context),
      child: Stack(
        children: [
          WebView(
            initialUrl: 'https://seasonmarket.co.kr/',
            javascriptMode: JavascriptMode.unrestricted,
            gestureNavigationEnabled: true,
            userAgent: 'random',
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            // onProgress: (progress) {
            //   setState(() {
            //     loading = progress == 100 ? true : false;
            //   });
            // },
            onPageFinished: (url) {
              setState(() {
                loading = false;
              });
            },
          ),
          loading ? const Center(child: CircularProgressIndicator()) : Stack(),
        ],
      ),
    );
  }
}
