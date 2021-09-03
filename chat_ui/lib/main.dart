import 'package:chat_ui/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Travel UI',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primaryColor: Colors.red, accentColor: Color(0xFFFEF9FB)),
        home: HomeScreen());
  }
}
