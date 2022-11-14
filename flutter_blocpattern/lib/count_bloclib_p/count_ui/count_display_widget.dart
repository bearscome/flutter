import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocpattern/count_bloclib_p/count_components/count_view.dart';
import 'package:flutter_blocpattern/count_bloclib_p/count_cubit/count_cubit.dart';

class BlocCubitDisplayWidget extends StatelessWidget {
  const BlocCubitDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const BlocCubitCounterView(),
      floatingActionButton: Row(
        children: [
          IconButton(
            onPressed: () => context.read<CounterCubit>().add(),
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () => context.read<CounterCubit>().remove(),
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
