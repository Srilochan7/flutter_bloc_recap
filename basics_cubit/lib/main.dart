import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/bloc/counter_bloc.dart';
import 'package:motivation/cubit/counter_cubit.dart';
import 'package:motivation/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit(),),
        BlocProvider(
        create: (context) => CounterBloc(),)
      ],
      
      child:MaterialApp(
          home: Home(),
        ),

    );
  }
}
