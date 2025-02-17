import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/cubit/counter_cubit.dart';

class IDPage extends StatelessWidget {
   IDPage({super.key});

  

  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      body:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    counterCubit.increment();
                  },
                  child: const Text('+'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    counterCubit.decrement();
                  },
                  child: const Text('-'),
                ),
              ],
            ),
    );
  }
}