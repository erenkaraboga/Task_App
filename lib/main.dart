import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_app_getx/app/modules/home/binding.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'app/data/services/storage/services.dart';
import 'app/modules/home/view.dart';
Future<void> main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const HomePage(),
        initialBinding: HomeBinding(),
        builder: EasyLoading.init(),
    );
  }
}
