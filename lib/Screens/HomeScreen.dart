import 'package:flutter/material.dart';
import 'package:rexpackaging/Screens/DesktopScreen.dart';
import 'package:rexpackaging/Screens/MobileScreen.dart';
import 'package:rexpackaging/Screens/TabletScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains) {
        print(constrains.maxWidth);
        if (constrains.maxWidth > 1000) {
          return DesktopScreen();
        } else if (constrains.maxWidth >= 550 && constrains.maxWidth < 1000) {
          return TabletScreen();
        } else {
          return MobileScreen();
        }
      }),
    );
  }
}
