import 'package:flutter/material.dart';
import 'package:marvel_api_flutter/components/books_view.dart';
import 'package:marvel_api_flutter/components/superhero_view.dart';
import 'package:marvel_api_flutter/controllers/book_controller.dart';
import 'package:marvel_api_flutter/models/books_model.dart';

void main() {
  Book book =
      Book(title: "Effective Java", author: "Joshua Bloch", price: 39.99);
  BookController controller = BookController(book);
  runApp(
    MyApp(controller: controller),
  );
}

class MyApp extends StatelessWidget {
  final BookController controller;
  const MyApp({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Marvel API Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: SuperheroView(),
        home: BookView(controller: controller));
  }
}
