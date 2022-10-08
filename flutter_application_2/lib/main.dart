import 'package:flutter/material.dart';
import 'package:flutter_application_1/animal_page.dart';
import 'package:flutter_application_1/model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: _MypageState());
  }
}

class _MypageState extends StatefulWidget {
  const _MypageState({super.key});

  @override
  State<_MypageState> createState() => __MypageStateState();
}

class __MypageStateState extends State<_MypageState> {
  static List<String> animalName = [
    'Bear',
    'Camel',
    'Deer',
  ];

  static List<String> animalImagePath = [
    'images/1.png',
    'images/2.png',
    'images/3.png',
  ];

  static List<String> animalLocation = [
    'KR',
    'JP',
    'CH',
  ];

  final List<Animal> animalData = List.generate(
    animalLocation.length,
    (index) => Animal(
        animalName[index], animalImagePath[index], animalLocation[index]),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview'),
      ),
      body: ListView.builder(
        itemCount: animalData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                animalData[index].name,
              ),
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(animalData[index].imgPath),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AnimalPage(
                      animal: animalData[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
