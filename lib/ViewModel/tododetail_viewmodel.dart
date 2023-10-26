import 'dart:ffi';

import 'package:first_flutter_project/Model/todo_model.dart';
import 'package:get/get.dart';
import '../Repositories/todo_repository.dart';

class TodoDetailViewModel extends GetxController {
  var isLoading = false.obs;
  var todo = Rx<TodoListResponse?>(null);

  final TodoRepository _todoDetailRepository = Get.put(TodoRepository());

  void getDetailTodo(int id) async {
    try {
      isLoading(true);
      var data = await _todoDetailRepository.getTodoDetail(id);
      todo.value = data;
    } catch (error) {
      print('Failed to fetch todo detail: $error');
    } finally {
      isLoading(false);
    }
  }


}