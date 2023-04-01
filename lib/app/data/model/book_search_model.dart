import 'package:flutter_getx/app/data/model/book_model.dart';

class SearchBookModel {
  String? error;
  String? total;
  String? page;
  List<BookModel>? books;

  SearchBookModel({this.error, this.total, this.page, this.books});

  SearchBookModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    total = json['total'];
    page = json['page'];
    if (json['books'] != null) {
      books = <BookModel>[];
      json['books'].forEach((v) {
        books!.add(BookModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['total'] = total;
    data['page'] = page;
    if (books != null) {
      data['books'] = books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
