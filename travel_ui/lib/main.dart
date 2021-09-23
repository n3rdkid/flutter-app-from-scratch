import 'package:flutter/material.dart';

import 'package:travel_ui/screens/test_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is tbhe root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel UI',
      theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7)),
      home: SellerDetails(
        onBackTap: () {},
      ),
    );
  }
}
