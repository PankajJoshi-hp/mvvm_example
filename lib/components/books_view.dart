import 'package:flutter/material.dart';
import 'package:marvel_api_flutter/controllers/book_controller.dart';

class BookView extends StatelessWidget {
  final BookController controller;

  const BookView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title: ${controller.book.title}",
                style: const TextStyle(fontSize: 18)),
            Text("Author: ${controller.book.author}",
                style: const TextStyle(fontSize: 18)),
            Text("Price: \$${controller.book.price}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.updateBook("Clean Code", "Robert C. Martin", 34.99);
              },
              child: const Text("Update Book"),
            ),
          ],
        ),
      ),
    );
  }
}
