import 'package:flutter/material.dart';
import 'package:appstore_android/screens/appList.dart';

class app extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appList(),
    );
  }
}
