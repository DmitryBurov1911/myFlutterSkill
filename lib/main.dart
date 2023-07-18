import 'package:flutter/material.dart';
import 'package:untitled2/calculate/calcur_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.yellow),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();

  void showToast(BuildContext context) {
    final snackBar = SnackBar(content: Text("Added to favorites"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalcurBloc>(
        create: (context) => CalcurBloc(),
        child: BlocBuilder<CalcurBloc, String>(
          builder: (context, state) {
            var bloc = BlocProvider.of<CalcurBloc>(context);
            return Scaffold(
                body: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                        child: TextField(
                          controller: _textController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'Enter town',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _textController.clear();
                                },
                                icon: const Icon(Icons.clear),
                              )),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(state.toString(),
                          style: const TextStyle(fontSize: 35)),
                      const SizedBox(height: 50),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                bloc.add(CalculIncrementEvent(
                                    _textController.value.text.toString()));
                              },
                              icon: const Icon(
                                Icons.add_circle_sharp,
                              )),
                          const SizedBox(height: 50),
                          IconButton(
                              onPressed: () {
                                showToast(context);
                              },
                              icon: const Icon(Icons.star),
                          ),
                        ],
                      ),

                      if (state == "null") const Text("Вы ничего не ввели"),
                    ],
                  ),
                ),
              ));
          },
        ));
  }
}
