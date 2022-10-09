import 'package:flutter/material.dart';
import 'package:flutter_application_3/dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
              child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              const Center(
                child: Image(
                  image: AssetImage('image/chef.gif'),
                  width: 170,
                  height: 190,
                ),
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.teal,
                    inputDecorationTheme: const InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            labelText: 'Enter Dice',
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextField(
                          controller: controller2,
                          decoration: const InputDecoration(
                            labelText: 'Enter Password',
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print(controller.text);
                            debugPrint('hi');
                            if (controller.text == 'asd' &&
                                controller2.text == 'asd') {
                              print('object');
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Dice(),
                                ),
                              );
                            } else if (controller.text != 'asd' &&
                                controller2.text == 'asd') {
                              showSnackBar(context, 'dice 철자가 일치하지 않습니다.');
                            } else if (controller.text == 'asd' &&
                                controller2.text != 'asd') {
                              showSnackBar(context, '비밀번호가 일치하지 않습니다.');
                            } else {
                              showSnackBar(context, '철자와 비밀번호가 일치하지 않습니다.');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              minimumSize: const Size(100, 50)),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}
