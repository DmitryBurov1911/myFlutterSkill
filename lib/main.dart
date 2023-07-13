import 'package:flutter/material.dart';
import 'package:untitled2/calculate/calcur_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalcurBloc>(
        create: (context) => CalcurBloc(),
        child: BlocBuilder<CalcurBloc, int>(
          builder: (context, state) {
            var bloc = BlocProvider.of<CalcurBloc>(context);
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                          state.toString(),
                          style: const TextStyle(fontSize: 50)
                      ),

                      const SizedBox(height: 50),

                      IconButton(
                          onPressed: () {
                            bloc.add(CalculIncrementEvent());
                          },
                          icon: const Icon(Icons.add_circle_sharp,)
                      ),

                      const SizedBox(height: 50),

                      IconButton(
                          onPressed: () {
                            bloc.add(CalculDecrementEvent());
                          },
                          icon: const Icon(Icons.dangerous_outlined,)
                      ),
                    ],
                  ),
                ),
              )
            );
          },
        )
    );
  }
}
