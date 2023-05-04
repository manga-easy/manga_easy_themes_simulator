import 'package:flutter/material.dart';
import 'package:theme_simulator/home_page.dart';
import 'package:theme_simulator/theme_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeService(),
      builder: (context, _) {
        return MaterialApp(
          title: 'Theme simulator',
          theme: ThemeService().returnThemeData(),
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
