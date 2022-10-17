import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 세로 또는 가로 고정
// ignore: library_prefixes
import 'package:image_picker/image_picker.dart' as ImagePicker;
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('camera'),
      ),
      body: const CameraExample(),
    );
  }
}

class CameraExample extends StatefulWidget {
  const CameraExample({super.key});

  @override
  State<CameraExample> createState() => _CameraExampleState();
}

void showDiaglog(contex) {
  ScaffoldMessenger.of(contex).showSnackBar(
    const SnackBar(
      content: Text('이미지가 저장되었습니다.'),
    ),
  );
}

class _CameraExampleState extends State<CameraExample> {
  File? _image;
  final picker = ImagePicker.ImagePicker();

  void _savePicture(context) async {
    if (_image == null) {
      return;
    }
    debugPrint('이미지 저장 $_image');

    GallerySaver.saveImage(_image!.path, albumName: 'hsl').then((value) {
      showDiaglog(context);
      debugPrint('value: $value');
    });
  }

  Widget showImage(context) {
    return Container(
      color: const Color(0xffd0cece),
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? const Text('No image selected.')
                  : Image.file(File(_image!.path)),
              _image != null
                  ? TextButton(
                      onPressed: () => _savePicture(context),
                      child: const Text('이미지 저장'),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Future getImage(ImagePicker.ImageSource imageSource) async {
    // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
    final image = await picker.pickImage(source: imageSource);
    if (image == null) {
      return;
    }
    setState(() {
      _image = File(image.path);
      // 가져온 이미지를 _image에 저장
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]); // 화면 세로 고정

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 25.0),
          showImage(context),
          const SizedBox(height: 50.0),
          Row(
            children: [
              FloatingActionButton(
                heroTag: "btn1",
                tooltip: 'pick Iamge',
                onPressed: () {
                  debugPrint(
                      'image Src: ${ImagePicker.ImageSource.camera}'); // 사진 캐쉬된 경로
                  getImage(ImagePicker.ImageSource.camera);
                },
                child: const Icon(Icons.add_a_photo),
              ),
              FloatingActionButton(
                heroTag: "btn2",
                tooltip: 'pick Iamge',
                onPressed: () {
                  getImage(ImagePicker.ImageSource.gallery);
                },
                child: const Icon(Icons.wallpaper),
              ),
            ],
          )
        ],
      ),
    );
  }
}
