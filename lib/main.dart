import 'package:flutter/material.dart';
import 'package:marvel_api_flutter/components/superhero_view.dart';


void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SuperheroView(),
    );
  }
}
