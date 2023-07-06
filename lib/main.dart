// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/presentation/main_page/screen_main_page.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        backgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white)
        )
      ),
      home: const ScreenMainPage(),
    );
  }
}
