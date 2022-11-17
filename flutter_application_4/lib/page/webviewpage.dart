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
  Future<bool> backAction(context) async {
    Future<bool> future = _webViewController.canGoBack();

    print('future_ $future');

    future.then((canGoBack) {
      print('future_canGoBack $canGoBack');
      if (canGoBack) {
        _webViewController.goBack();
      } else {
        print('future_더이상 뒤로갈페이지가 없습니다.');
        if (Platform.isIOS) {
          exit(0);
        } else {
          SystemNavigator.pop();
        }
      }
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
            initialUrl: 'https://www.google.com',
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
