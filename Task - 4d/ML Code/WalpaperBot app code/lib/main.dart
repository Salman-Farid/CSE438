import 'package:flutter/material.dart';
import 'package:wallpapers_hub/views/home_page.dart';
import 'package:wallpapers_hub/views/preference.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home:  WallpaperSuggestionPage(),
    );
  }
}

