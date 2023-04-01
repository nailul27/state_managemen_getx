import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_getx/app/util/color_pallete.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorPallete.bgColor,
      body: Center(child: Image(image: AssetImage('assets/logo.png'))),
    );
  }
}
