import 'package:flutter/material.dart';
import 'package:untitled2/calculate/calcur_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/net/get_picture.dart';

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
  final _textController = TextEditingController();

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
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter town'),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(state.toString(),
                          style: const TextStyle(fontSize: 35)),
                      const SizedBox(height: 50),
                      IconButton(
                          onPressed: () {
                            bloc.add(CalculIncrementEvent("BTC"));
                          },
                          icon: const Icon(
                            Icons.add_circle_sharp,
                          )),
                      const SizedBox(height: 50),
                      IconButton(
                          onPressed: () async {
                            await getHttp("BTC");
                          },
                          icon: const Icon(Icons.ac_unit_outlined)),
                      if (state == "100" || state == "-100") const Text("HHH"),
                    ],
                  ),
                ),
              ));
          },
        ));
  }
}
