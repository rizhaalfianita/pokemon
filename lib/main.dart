import 'package:flutter/material.dart';
import 'package:pokemon/features/home/ui/page/splash.dart';
import 'package:pokemon/shared/const/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokemon',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: red),
          useMaterial3: true,
        ),
        home: const Splash());
  }
}
