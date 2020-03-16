import 'package:flutter/material.dart';

class game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<game> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Display Image Tutorial'),
          ),
          body: Center(
            child: Image.network(
              'https://flutter.io/images/catalog-widget-placeholder.png',
              height: 100,
              width: 150
            )
          ),
        ),
      );
  }
}
