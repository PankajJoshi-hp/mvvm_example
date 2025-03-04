import 'package:marvel_api_flutter/models/books_model.dart';

class BookController {
  Book book;

  BookController(this.book);

  void updateBook(String title, String author, double price) {
    book.title = title;
    book.author = author;
    book.price = price;
  }
}
