import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app_getx/app/core/values/colors.dart';
import 'package:task_app_getx/app/data/models/task.dart';
import 'package:task_app_getx/app/modules/home/controller.dart';
import 'package:task_app_getx/app/core/utils/extensions.dart';
import 'package:task_app_getx/app/modules/home/widgets/add_cart.dart';
import 'package:flutter/services.dart';
import 'package:task_app_getx/app/modules/home/widgets/task_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: background,
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(4.0.wp),
                child: Text(
                  "Listem",
                  style:
                      TextStyle(fontSize: 24.0.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(
                () => GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    ...controller.tasks
                        .map((element) => LongPressDraggable(
                            onDragStarted: () =>
                                controller.changeDeeleting(true),
                            onDraggableCanceled: (_, __) =>
                                controller.changeDeeleting(false),
                            onDragEnd: (_) => controller.changeDeeleting(false),
                            feedback: Opacity(
                                opacity: 0.8, child: TaskCard(task: element)),
                            child: TaskCard(task: element)))
                        .toList(),
                    AddCard()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(()=>
       FloatingActionButton(
            onPressed: () {},
            child: Icon(
              controller.deleting.value ? Icons.delete : Icons.add,
              color: Colors.black,
            ),
            backgroundColor: addBoxColor),
      ),
    );
  }
}
