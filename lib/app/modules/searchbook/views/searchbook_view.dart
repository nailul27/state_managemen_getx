import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_getx/app/util/color_pallete.dart';

import '../../../routes/app_pages.dart';
import '../controllers/searchbook_controller.dart';

class SearchbookView extends GetView<SearchbookController> {
  const SearchbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgMain,
      appBar: AppBar(
        title: const Text('Search Book'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 12.0,
            ),
            decoration: BoxDecoration(
              color: ColorPallete.iconBg,
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
              border: Border.all(
                width: 1.5,
                color: ColorPallete.bgColor,
              ),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                    color: ColorPallete.bgColor,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: null,
                    decoration: const InputDecoration.collapsed(
                      filled: true,
                      fillColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      hintText: "Search",
                    ),
                    onFieldSubmitted: (value) {
                      if (value.trim().isEmpty) {
                        Get.snackbar('Info !!!', 'Mohon inputkan sesuatu !!!',
                            backgroundColor: ColorPallete.bgColor,
                            colorText: ColorPallete.textColor,
                            margin: const EdgeInsets.symmetric(
                              vertical: 30,
                              horizontal: 10,
                            ),
                            snackPosition: SnackPosition.BOTTOM);
                      } else {
                        controller.searchBook(value);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<SearchbookController>(builder: (controller) {
              if (controller.isloading == false) {
                if (controller.listBook.isEmpty) {
                  return const Center(child: Text('No Data Found'));
                } else {
                  Get.snackbar('Success.', 'Pencarian Berhasil !!!',
                      backgroundColor: ColorPallete.bgSuccess,
                      colorText: ColorPallete.textColor,
                      margin: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 10,
                      ),
                      snackPosition: SnackPosition.BOTTOM);
                  return ListView.builder(
                    itemCount: controller.listBook.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            color: ColorPallete.bgColor),
                        width: Get.width,
                        height: Get.height * 0.15,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Material(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          color: ColorPallete.bgColor,
                          child: InkWell(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            onTap: () => Get.toNamed(Routes.book, arguments: {
                              'isbn': controller.listBook[index].isbn13
                            }),
                            child: Row(
                              children: [
                                Image.network(
                                  controller.listBook[index].image!,
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        controller.listBook[index].title!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: ColorPallete.textColor),
                                      ),
                                      Text(
                                        controller.listBook[index].subtitle!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: ColorPallete.textColor),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "ISBN : ${controller.listBook[index].isbn13!}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color:
                                                      ColorPallete.textColor),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              child: Text(
                                                controller
                                                    .listBook[index].price!,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: ColorPallete.bgMain),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          ),
        ],
      ),
    );
  }
}
