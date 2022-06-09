import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit2cubit_new/cubit/color/color_cubit.dart';
import 'package:cubit2cubit_new/cubit/counter/counter_cubit.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<ColorCubit>(
      create: (context) => ColorCubit(),
    ),
    BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(colorCubit: context.read<ColorCubit>()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: context.watch<ColorCubit>().state.color,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text(
                    'Change Color',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  onPressed: () {
                    context.read<ColorCubit>().changeColor();
                  },
                ),
                const SizedBox(height: 20.0),
                Text(
                  context.watch<CounterCubit>().state.counterNumber.toString(),
                  style: const TextStyle(
                    fontSize: 52.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  child: const Text(
                    'Increment Counter',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  onPressed: () {
                    context.read<CounterCubit>().changeCounter();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
