import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../util/color_pallete.dart';

class TaskWidget extends StatelessWidget {
  final int no;
  final String title;
  final String route;

  const TaskWidget(
      {super.key,
      required this.no,
      required this.title,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: Get.width,
        height: 100,
        decoration: const BoxDecoration(
          color: ColorPallete.textColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Material(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            onTap: () => Get.toNamed(route),
            splashColor: ColorPallete.bgColor,
            hoverColor: ColorPallete.textColor,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 55,
                  width: 55,
                  decoration: const BoxDecoration(
                    color: ColorPallete.iconBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      no.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
