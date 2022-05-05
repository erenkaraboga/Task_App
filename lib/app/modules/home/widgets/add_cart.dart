import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
        onTap: () async {
           await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 3.0.wp),
            title: "Görev Tipi",
            radius: 15,
            content: Form(
              key:homeCtrl.formKey,
              child: Column(children: [
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 3.0.wp), 
                   child: TextFormField(
                    controller:homeCtrl.editCtrl,
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Başlık"
                    ),
                    validator: (val){
                      if(val==null||val.trim().isEmpty){
                        return "Lütfen Başlık Giriniz";
                      }
                      else{return null;}
                    },
                   ),
                 ),
              ]),
             )
           );
        },
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