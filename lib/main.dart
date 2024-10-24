import 'package:flutter/material.dart';
import 'package:fragance/Views/home_page.dart';
import 'package:fragance/Views/start_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp()
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/start_page": (context) => StartPage(),
        "/home_page": (context) => HomePage(),
      },
      home: StartPage(),
    );
  }
}
