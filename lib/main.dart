import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    CupertinoApp(
            debugShowCheckedModeBanner: kDebugMode,
      scrollBehavior: CupertinoScrollBehavior(),
      home: WeatherApp(),

    ),
  );
}
class WeatherApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(color: Colors.blue);
  }
}