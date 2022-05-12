import 'dart:math';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app_getx/app/core/utils/extensions.dart';
import 'package:task_app_getx/app/core/values/colors.dart';
import 'package:task_app_getx/app/modules/home/controller.dart';
import 'package:task_app_getx/app/modules/home/widgets/add_cart.dart';

import '../../../data/models/task.dart';

class TaskCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  final Task task;
  TaskCard({Key? key, required this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = HexColor.fromHex(task.color);
    final squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(4.0.wp),
      decoration: const BoxDecoration(
          color: addBoxColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(11),
              bottomRight: Radius.circular(11))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // TODO
        StepProgressIndicator(
            totalSteps: 100,
            currentStep: 100,
            size: 5,
            padding: 0,
            selectedGradientColor: LinearGradient(
                colors: [color.withOpacity(0.5), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            unselectedGradientColor: const LinearGradient(
                colors: [addBoxColor, addBoxColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(IconData(task.icon,fontFamily: 'MaterialIcons'),color: color,),
      )
      ]),
    );
  }
}
