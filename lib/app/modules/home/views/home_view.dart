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
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallete.bgMain,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.17,
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      'silahkan pilih task',
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
              route: Routes.book,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const TaskWidget(
              no: 2,
              title: 'Search Book With Detail Book',
              route: Routes.search,
            ),
          ],
        ),
      ),
    );
  }
}
