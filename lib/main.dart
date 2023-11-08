import 'package:flutter/material.dart';
import 'package:project_mate/home.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 173, 229, 255))),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
