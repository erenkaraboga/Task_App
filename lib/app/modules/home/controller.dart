import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_app_getx/app/data/models/task.dart';
import 'package:task_app_getx/app/data/services/storage/repository.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;
  HomeController({required this.taskRepository});
  final tasks = <Task>[].obs;
  final formKey = GlobalKey<FormState>();
  final editCtrl = TextEditingController();
  final deleting= false.obs;
  final chipIndex = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    editCtrl.dispose();
    super.onClose();
  }
  bool addTask(Task task) {
   if(tasks.contains(task)){
     return false;
   }
   else{
     tasks.add(task);
     return true;
   }
  }
  void changeChipIndex(int value) {
    chipIndex.value = value;
  }
  void changeDeeleting(bool value){
    deleting.value=value;
  }
}
