import 'package:flutter_getx/app/data/model/book_model.dart';

import 'package:flutter_getx/app/util/app_constants.dart';
import 'package:flutter_getx/app/data/core/dio_client.dart';

class BookRepo {
  final DioClient dioClient;
  BookRepo(this.dioClient);

  Future getBook({String isbn = '9780131495050'}) async {
    try {
      final response = await dioClient.get(
        AppConstants.bookUri + isbn,
      );

      BookModel result = BookModel.fromJson(response);
      return result;
    } catch (e) {
      return e;
    }
  }
}