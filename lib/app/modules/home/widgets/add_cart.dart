import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_app_getx/app/core/utils/extensions.dart';
import 'package:task_app_getx/app/core/values/colors.dart';
import 'package:task_app_getx/app/modules/home/controller.dart';
import 'package:task_app_getx/app/widgets/icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../data/models/task.dart';

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
        onPressed: () async {
          await Future.delayed(const Duration(milliseconds: 300));
          await Get.defaultDialog(
              backgroundColor: boxes,
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
                  Wrap(
                      spacing: 2.0.wp,
                      children: icons
                          .map((e) => Obx(() {
                                final index = icons.indexOf(e);
                                return ChoiceChip(
                                  backgroundColor: boxes,
                                  pressElevation: 0,
                                  selectedColor: background,
                                  label: e,
                                  selected: homeCtrl.chipIndex.value == index,
                                  onSelected: (bool selected) {
                                    homeCtrl.chipIndex.value =
                                        selected ? index : 0;
                                  },
                                );
                              }))
                          .toList()),
                    ElevatedButton(onPressed: (){
                      
                        
                    }, child: const Text("Onayla",style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                      primary: background,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      minimumSize: const Size(150, 40)
                    ),
                    
                    )      
                ]),
              ));
        },
        style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
            depth: 5,
            shadowLightColorEmboss: Colors.black,
            shadowDarkColor: grey,
            shadowLightColor: grey,
            color: boxes),
      ),
    );
  }
  void onPressed(){
    
  }
}
