import 'package:flutter/material.dart';
import 'package:flutter_task/views/house_rules_list_view.dart';
import 'package:flutter_task/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'House Roules App',
      theme: ThemeData(
        // primarySwatch: Colors.red,
        useMaterial3: true,
        colorSchemeSeed: const Color(0xff6750a4),
        appBarTheme: const AppBarTheme(
            centerTitle: true, elevation: 20, color: const Color(0xff6750a4)),
        brightness: Brightness.light,
      ),
      home: const LoginView(),
    );
  }
}
