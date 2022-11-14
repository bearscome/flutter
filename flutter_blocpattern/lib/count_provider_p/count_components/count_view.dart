import 'package:flutter/material.dart';
import 'package:flutter_blocpattern/count_provider_p/count_provider/count_provider.dart';
import 'package:provider/provider.dart';

class ProviderCountView extends StatelessWidget {
  const ProviderCountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<CountProvider>(
        // Consumer를 통해 provider에 있는 데이터에 접근 가능
        builder: (context, value, child) {
          return Text(
            value.getCount.toString(),
          );
        },
      ),
    );
  }
}
