import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:task_app_getx/app/core/utils/extensions.dart';
import 'package:task_app_getx/app/core/values/colors.dart';
import 'package:task_app_getx/app/modules/home/controller.dart';
import 'package:task_app_getx/app/widgets/icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AddCard extends StatelessWidget {
  AddCard({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(4.0.wp),
      child: NeumorphicButton(
        child: const Icon(Icons.add),
        onPressed: openDialog,
        style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
            depth: 3,
            shadowLightColorEmboss: Colors.black,
            shadowDarkColor: grey,
            shadowLightColor: grey,
            color: boxes),
      ),
    );
  }

  void openDialog() async {
    await Get.defaultDialog(
        titlePadding: EdgeInsets.symmetric(vertical: 3.0.wp),
        title: "Görev Tipi",
        radius: 15,
        content: Form(
          key: homeCtrl.formKey,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
              child: TextFormField(
                controller: homeCtrl.editCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Başlık"),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return "Lütfen Başlık Giriniz";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ]),
        ));
  }
}
