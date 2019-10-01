import 'package:flutter/widgets.dart';
import 'package:sach_mem/core/models/Book.dart';
import 'package:sach_mem/core/services/Api.dart';
import 'package:sach_mem/locator.dart';

class BookCRUD extends ChangeNotifier {
  Api _api = locator<Api>();

  List<Book> books;

  Future<List<Book>> fetchBooks() async {
    var res = await _api.getDataCollection();
    books = res.documents.map((doc) => Book.fromMap(doc.data, doc.documentID)).toList();
    return books;
  }
}