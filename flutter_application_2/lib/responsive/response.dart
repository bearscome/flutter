import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.desktopBdoy,
    required this.mobileBody,
  });

  final Widget mobileBody;
  final Widget desktopBdoy;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 800) {
        return mobileBody;
      } else {
        return desktopBdoy;
      }
    }); // 부모의 위젯에 따라 크기가 변경된다.
  }
}
