import 'dart:async';

import 'package:bloc_1/notification/localNotification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Alarm extends StatefulWidget {
  const Alarm({super.key});
  final PageTitle = '알람';

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  late StreamSubscription<int> subscription;
  int _currentTick = 0;
  bool _isPaused = false;
  bool _stared = false;
  final pushAl = LocalNotificationTest();

  @override
  void initState() {
    super.initState();
    pushAl.initLocalNotificationPlugin();
  }

  void _start(int duraction) {
    if (_stared) {
      return;
    }

    FocusScope.of(context).unfocus();
    subscription = const Ticker().tick(ticks: duraction).listen((value) {
      setState(() {
        _stared = true;
        _isPaused = false;
        _currentTick = value;
      });
    });

    subscription.onDone(() {
      debugPrint('끝났어요!');
      _reset();
      pushAl.sampleNotification(title: '타이머 종료', body: "타이머가 종료되었니다.");
    });
  }

  void _resume() {
    if (_stared) {
      return;
    }
    setState(() {
      _stared = true;
      _isPaused = false;
    });
    subscription.resume();
  }

  void _pause() {
    if (!_stared) {
      return;
    }
    setState(() {
      _stared = false;
      _isPaused = true;
    });
    subscription.pause();
  }

  void _reset() {
    setState(() {
      _stared = false;
      _isPaused = false;
    });
    subscription.cancel();
    _currentTick = 0;
    _textController.clear();
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('알람'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Text(
                _currentTick.toString(),
                style:
                    const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _textController,
                // onSubmitted: (String value) => print(value),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      _currentTick = 0;
                    });
                    return;
                  }
                  setState(() {
                    _currentTick = int.parse(value);
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '알람 시간',
                ),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_currentTick == 0) {
                          showSnackBar('설정 시간은 0보다 커야합니다.');
                          return;
                        }
                        _start(_currentTick);
                      },
                      child: const Text('시작')),
                  ElevatedButton(
                      onPressed: () => _isPaused ? _resume() : _pause(),
                      child: Text(_isPaused ? '재 시작' : '멈춤')),
                  ElevatedButton(
                      onPressed: () => _reset(), child: const Text('초기화')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x)
        .take(ticks + 1);
  }
}
