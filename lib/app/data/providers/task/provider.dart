import 'dart:convert';

import 'package:get/get.dart';
import 'package:task_app_getx/app/core/utils/keys.dart';
import 'package:task_app_getx/app/data/services/storage/services.dart';

import '../../models/task.dart';

class TaskProvider{
 final StorageService _stroage = Get.find<StorageService>();
  
  List<Task> readTasks(){
    var tasks=<Task>[];
    jsonDecode(_stroage.read(taskKey).toString()).forEach((e)=>tasks.add(Task.fromJson(e)));
    return tasks;
  }
  void writeTask(List<Task> tasks){
    _stroage.write(taskKey, jsonEncode(tasks));
  }
}