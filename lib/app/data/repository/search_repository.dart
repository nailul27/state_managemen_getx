import 'package:flutter_getx/app/data/model/book_search_model.dart';

import '../../util/app_constants.dart';
import '../core/dio_client.dart';

class SearchRepo {
  final DioClient dioClient;
  SearchRepo(this.dioClient);

  Future searchBook(String keyword) async {
    try {
      final response = await dioClient.get(
        AppConstants.searchUri + keyword,
      );
      SearchBookModel result = SearchBookModel.fromJson(response);
      return result;
    } catch (e) {
      return e;
    }
  }
}
