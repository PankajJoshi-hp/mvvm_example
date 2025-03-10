import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_api_flutter/components/ci_cd_check.dart';
import 'package:marvel_api_flutter/controllers/book_controller.dart';

class BookView extends StatefulWidget {
  final BookController controller;

  const BookView({super.key, required this.controller});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title: ${widget.controller.book.title}",
                style: const TextStyle(fontSize: 18)),
            Text("Author: ${widget.controller.book.author}",
                style: const TextStyle(fontSize: 18)),
            Text("Price: \$${widget.controller.book.price}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.controller.updateBook("Clean Code", "Robert C. Martin", 34.99);
              },
              child: const Text("Update Book"),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(CICDCheck());
                },
                child: Text('CICD page'))
          ],
        ),
      ),
    );
  }
}
