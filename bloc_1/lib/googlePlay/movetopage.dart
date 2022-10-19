import 'package:launch_review/launch_review.dart';

class MoveToStore {
  void move2Page({
    String androidAppId = 'com.iyaffle.rangoli',
    String iOSAppId = '585027354',
  }) async {
    LaunchReview.launch(androidAppId: androidAppId, iOSAppId: iOSAppId);
  }
}
