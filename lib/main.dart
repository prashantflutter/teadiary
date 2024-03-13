import 'package:flutter/material.dart';
import 'package:teadiary/Pages/HomePage.dart';

import 'Constant/AppColor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:primeColor),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}


