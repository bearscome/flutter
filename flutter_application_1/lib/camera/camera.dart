import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('안녕'),
        onPressed: () async {
          var picker = ImagePicker();
          // var image = await picker.pickImage(source: ImageSource.gallery);

          //카메라를 가져오기
          await picker.pickImage(source: ImageSource.camera);

          //비디오 선택화면
          // picker.pickVideo(source: ImageSourse.gallery);

          //여러이미지 선택
          // picker.pickMultiImage(source: ImageSource.gallery);
        },
      ),
    );
  }
}
