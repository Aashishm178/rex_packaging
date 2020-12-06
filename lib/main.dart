import 'package:flutter/material.dart';
import 'package:rexpackaging/Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
