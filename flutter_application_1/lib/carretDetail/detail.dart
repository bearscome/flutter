import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/photo_model.dart';
import 'package:http/http.dart' as http;

Future<Album> _getPostDetail(int albumId) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$albumId'));

  if (response.statusCode == 200) {
    var jsonData = Album.fromJson(jsonDecode(response.body));
    return jsonData;
  } else {
    throw Exception('Faild');
  }
}

class Detail extends StatelessWidget {
  final int albumId;

  const Detail({
    super.key,
    required this.albumId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("상품정보"),
      ),
      body: Center(
        child: DetailWidget(albumId: albumId),
      ),
    );
  }
}

class DetailWidget extends StatefulWidget {
  final int albumId;
  const DetailWidget({super.key, required this.albumId});

  @override
  State<DetailWidget> createState() => _DetailWidgetState(albumId: albumId);
}

class _DetailWidgetState extends State<DetailWidget> {
  _DetailWidgetState({required this.albumId});

  final int albumId;
  late Future<Album> detailAlbum;

  @override
  void initState() {
    super.initState();
    detailAlbum = _getPostDetail(albumId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
      future: detailAlbum,
      builder: (context, snapshot) {
        String title = snapshot.data!.title;
        String url = snapshot.data!.url;

        if (snapshot.hasData) {
          return Column(
            children: [
              Image(
                image: NetworkImage(url),
              ),
              Text(title),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.hasError}');
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
