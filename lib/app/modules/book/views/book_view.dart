import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_getx/app/widget/rating_widget.dart';
import 'package:flutter_getx/app/util/color_pallete.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgMain,
      appBar: AppBar(
        backgroundColor: ColorPallete.bgColor,
        title: const Text('Detail Book'),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<BookController>(
        builder: (controller) {
          if (controller.book != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.28,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: ColorPallete.bgColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.book?.title ?? '',
                              style: const TextStyle(
                                  color: ColorPallete.textColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              controller.book?.subtitle ?? '',
                              style: const TextStyle(
                                  color: ColorPallete.textColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Authors : ${controller.book?.authors ?? ''}",
                              style: const TextStyle(
                                color: ColorPallete.textColor,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Publisher : ${controller.book?.publisher ?? ''}",
                              style: const TextStyle(
                                color: ColorPallete.textColor,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Language : ${controller.book?.language ?? ''}",
                              style: const TextStyle(
                                color: ColorPallete.textColor,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "ISBN : ${controller.book?.isbn10 ?? ''} | ${controller.book?.isbn13 ?? ''} ",
                              style: const TextStyle(
                                color: ColorPallete.textColor,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Rating :",
                              style: TextStyle(
                                color: ColorPallete.textColor,
                                fontSize: 12,
                              ),
                            ),
                            RatingBar(
                                rating: double.tryParse(
                                        controller.book?.rating ?? '0.0') ??
                                    0.0)
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: ColorPallete.bgMain,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          width: Get.width * 0.3,
                          height: Get.height * 0.2,
                          child: Image.network(
                            controller.book?.image ?? '',
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "       ${controller.book?.desc ?? ''}",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            );
          } else {
            return Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.28,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: ColorPallete.bgColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  child: const Center(child: CircularProgressIndicator()),
                ),
                const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
