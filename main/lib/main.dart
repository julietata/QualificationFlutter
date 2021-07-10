import 'package:flutter/material.dart';
import 'package:main/view/login.dart';
import 'package:main/utils/globals.dart' as globals;
import 'package:main/view/navigationbar.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(body: LoginPage()));
  }
}
