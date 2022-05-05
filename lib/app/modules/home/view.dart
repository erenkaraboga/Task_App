import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app_getx/app/modules/home/controller.dart';
import 'package:task_app_getx/app/core/utils/extensions.dart';
import 'package:task_app_getx/app/modules/home/widgets/add_cart.dart';
class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ListView(
          children:[
            Padding(
              padding:  EdgeInsets.all(4.0.wp),
              child: Text("Listem",style: TextStyle(fontSize: 24.0.sp,fontWeight: FontWeight.bold),),
            ),
            GridView.count(crossAxisCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [AddCard()],
            )
          ],
        ),
      ),
    );
  }
}
