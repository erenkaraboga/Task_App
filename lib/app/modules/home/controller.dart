import 'package:get/get.dart';
import 'package:task_app_getx/app/data/models/task.dart';
import 'package:task_app_getx/app/data/services/storage/repository.dart';

class HomeController extends GetxController{
  TaskRepository taskRepository;
  HomeController({required this.taskRepository});
  final tasks= <Task>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_)=>taskRepository.writeTasks(tasks));
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}