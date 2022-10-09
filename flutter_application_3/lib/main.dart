import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Future',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String result = 'hi';

  Future<void> _futureTest() async {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      print('0');
      setState(() {
        result = '11111';
        print(result);
        print('2');
      });
      print('3');
      print('4');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future test'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  print('1');
                  _futureTest();
                  print('3');
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Future test',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                result,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.redAccent,
                ),
              ),
              const Divider(
                height: 20,
                thickness: 2,
              ),
              FutureBuilder(
                future: myFuture(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    );
                  }

                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> myFuture() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'another Future completed';
}
