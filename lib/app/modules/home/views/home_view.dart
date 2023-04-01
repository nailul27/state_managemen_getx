import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_getx/app/util/color_pallete.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/task_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgMain,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * 0.1,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Hai, Guest",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Selamat Datang",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/avatar.png",
                  width: 35.0,
                  height: 35.0,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          Container(
            height: Get.height * 0.17,
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/vector-ppl.png'),
                  alignment: AlignmentDirectional.bottomEnd),
              color: ColorPallete.bgColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  width: Get.width * 0.3,
                  child: const Text(
                    'Mau pilih task mana nih ?',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: ColorPallete.textColor),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Pilih task',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const TaskWidget(
            no: 1,
            title: 'Get Detail Book',
            desc:
                'Implementasi API https://api.itbook.store/1.0/books/9781484206485',
            route: Routes.book,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const TaskWidget(
            no: 2,
            title: 'Search Book With Detail Book',
            desc:
                'Implementasi API https://api.itbook.store/1.0/search/flutter developer',
            route: Routes.search,
          ),
        ],
      ),
    );
  }
}
