import 'package:get/get.dart';
import 'package:flutter_getx/app/data/model/book_model.dart';
import 'package:flutter_getx/app/data/repository/book_repository.dart';

class BookController extends GetxController {
  final BookRepo bookRepo;
  var data = Get.arguments;

  BookController(this.bookRepo);

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getBook(data != null ? data['isbn'] : null);
    });
  }

  BookModel? book;

  Future<void> getBook(isbn) async {
    if (isbn != null) {
      BookModel result = await bookRepo.getBook(isbn: isbn);
      book = result;
    } else {
      BookModel result = await bookRepo.getBook();
      book = result;
    }
    update();
  }
}
