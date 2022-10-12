import 'package:bloc_1/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountPage extends StatelessWidget {
  CountPage({super.key});

  late CounterProvider _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('test_provider'),
      ),
      body: Consumer<CounterProvider>(
        builder: (context, value, child) {
          return Center(
            child: Column(
              children: [
                Text(
                  _countProvider.count.toString(),
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () => _countProvider.increase(),
                        child: Text('더하기')),
                    TextButton(
                        onPressed: () => _countProvider.decrease(),
                        child: Text('뺴기')),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
