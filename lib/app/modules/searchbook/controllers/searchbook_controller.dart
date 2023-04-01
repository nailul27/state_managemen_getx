import 'package:get/get.dart';
import 'package:flutter_getx/app/data/model/book_model.dart';
import 'package:flutter_getx/app/data/model/book_search_model.dart';
import 'package:flutter_getx/app/data/repository/search_repository.dart';

class SearchbookController extends GetxController {
  final SearchRepo searchRepo;
  bool isloading = false;

  SearchbookController(this.searchRepo);

  List<BookModel> listBook = [];
  Future<void> searchBook(String keyword) async {
    isloading = true;
    update();

    SearchBookModel result = await searchRepo.searchBook(keyword);
    isloading = false;

    listBook = result.books!;
    update();
  }
}
