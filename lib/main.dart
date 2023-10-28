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
  bool toggle = true;

  void onClicked() {
    // if we don't have setState, It's not reflected on UI in real-time
    // also code in curly brackets is not nescessary, but it's standard
    setState(() {
      numbers.add(numbers.length);
    });
  }

  void onRefreshed() {
    setState(() {
      numbers.clear();
    });
  }

  void onClickToggle() {
    setState(() {
      toggle = !toggle;
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
              IconButton(
                onPressed: onClickToggle,
                icon: Icon(
                  toggle ? Icons.toggle_on_rounded : Icons.toggle_off_rounded,
                ),
                iconSize: 40,
              ),
              toggle ? const _MyLargeTitle() : const Text('nothing'),
              for (var el in numbers) Text('$el'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onClicked,
                    icon: const Icon(
                      Icons.add_box_rounded,
                    ),
                    iconSize: 40,
                  ),
                  IconButton(
                    onPressed: onRefreshed,
                    icon: const Icon(
                      Icons.restore_from_trash_rounded,
                    ),
                    iconSize: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyLargeTitle extends StatefulWidget {
  const _MyLargeTitle();

  @override
  State<_MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<_MyLargeTitle> {
  // int count = 0;

// build 를 하기 전에 먼저 실행
// 대표적으로 API 불러올때 사용
  @override
  void initState() {
    print('initState!');
    super.initState();
  }

// 해당 위젯이 화면에서 사라질때 실행된다.
  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build!');
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
