import 'package:first_release_app/pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '로또 번호 추첨기',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: lottoHome(),
    );
  }
}
