import 'package:chatty/screens/home_screen.dart';
import 'package:chatty/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatty',
      theme: AppTheme
          .light(), // default theme according the platform mode (dark or light)
      darkTheme: AppTheme
          .dark(), // default theme according the platform mode (dark or light)
      // themeMode: ThemeMode.dark, //the theme set always for app
      home: HomeScreen(),
    );
  }
}
