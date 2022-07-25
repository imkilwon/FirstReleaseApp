import 'package:first_release_app/pages/Home.dart';
import 'package:first_release_app/pages/DeleteHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '로또 번호 추첨기',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: MyHome(),
    );
  }
}

