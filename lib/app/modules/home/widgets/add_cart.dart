import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app_getx/app/core/utils/extensions.dart';
import 'package:task_app_getx/app/modules/home/controller.dart';
import 'package:task_app_getx/app/widgets/icons.dart';
import 'package:dotted_border/dotted_border.dart';
class AddCard extends StatelessWidget {
   AddCard({ Key? key }) : super(key: key);
  final homeCtrl=Get.find<HomeController>(); 
  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth=Get.width -12.0.wp;
    return Container(
      width: squareWidth/2,
      height: squareWidth/2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: (){},
        child: DottedBorder(
         dashPattern: const [8,4], 
         color: Colors.grey[400]!,
          child:
             Center(
              child: Icon(Icons.add,color: Colors.grey,size: 10.0.wp,
              ),
           ),
        ),
      ),
    );
  }
}