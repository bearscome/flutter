import 'package:flutter/material.dart';
import 'package:flutter_blocpattern/count_provider_p/count_provider/count_provider.dart';
import 'package:flutter_blocpattern/count_provider_p/count_components/count_view.dart';
import 'package:provider/provider.dart';

class ProviderDisplayWidget extends StatelessWidget {
  const ProviderDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CountProvider countProvider =
        Provider.of<CountProvider>(context, listen: false);
    // Provider을 호출한다. listen:false를 통해 구독된 모든 위젯들에게 알림을 보내지 않는다.
    return Scaffold(
      appBar: AppBar(),
      body: const ProviderCountView(),
      floatingActionButton: Row(
        children: [
          IconButton(
            onPressed: () {
              countProvider.add();
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              countProvider.remove();
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
