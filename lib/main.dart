import 'dart:io';
import 'package:dio/dio.dart';
//import 'package:apiconnect/caller.dart';
import 'package:flutter/material.dart';
import 'Basepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      scrollBehavior: MaterialScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: Basescreen(),
    );
  }
}
