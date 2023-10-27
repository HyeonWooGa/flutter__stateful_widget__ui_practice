import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> numbers = [];

  void onClicked() {
    // if we don't have setState, It's not reflected on UI in real-time
    // also code in curly brackets is not nescessary, but it's standard
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _MyLargeTitle(),
              for (var el in numbers) Text('$el'),
              IconButton(
                onPressed: onClicked,
                icon: const Icon(
                  Icons.add_box_rounded,
                ),
                iconSize: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyLargeTitle extends StatelessWidget {
  const _MyLargeTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Click Count',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context)
            .textTheme
            .titleLarge!
            .color, // titleLarge 는 항상 있다는 뜻 (!), titleLarge 는 있을 수도 없을 수도 있다는 뜻 (?)
      ),
    );
  }
}
