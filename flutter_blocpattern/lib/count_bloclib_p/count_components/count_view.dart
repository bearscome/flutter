import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocpattern/count_bloclib_p/count_cubit/count_cubit.dart';

class BlocCubitCounterView extends StatelessWidget {
  const BlocCubitCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          print('$state');
          return Text(
            '$state',
            style: const TextStyle(fontSize: 50),
          );
        },
      ),
    );
  }
}
