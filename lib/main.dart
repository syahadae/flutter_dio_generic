import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:latihan_dio/src/features/home/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: myHomepage(),
    );
  }
}
