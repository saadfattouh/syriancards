import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:syriancards/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Text Kit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AnimatedTextExample _example;

  @override
  void initState() {
    super.initState();
    _example = animatedTextExamples();
  }

  @override
  Widget build(BuildContext context) {
    final animatedTextExample = _example;

    int max = 2;
    int randomNumber = Random().nextInt(max) + 1;
    int duration = (randomNumber * 1000) + 4000;

    Future.delayed(Duration(milliseconds: duration), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const LoginPage()));
    });

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: animatedTextExample.color),
                child: Center(
                  key: ValueKey(animatedTextExample.label),
                  child: animatedTextExample.child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedTextExample {
  final String label;
  final Color? color;
  final Widget child;

  const AnimatedTextExample({
    required this.label,
    required this.color,
    required this.child,
  });
}

AnimatedTextExample animatedTextExamples() => AnimatedTextExample(
      label: 'TextLiquidFill',
      color: Colors.white,
      child: TextLiquidFill(
        text: 'Syrian Cards',
        waveColor: Colors.blue,
        boxBackgroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          fontFamily: 'Horizon',
        ),
        loadDuration: Duration(seconds: 4),
        waveDuration: Duration(seconds: 1),
      ),
    );
