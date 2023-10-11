import 'package:get/get.dart';

import '../Model/todo_model.dart';
import '../Services/todo_service.dart';

class TodoRepository {
  final TodoListService _todoListService = Get.put(TodoListService());

  Future<List<TodoListResponse>> getTodoList() async {
    try {
      final data = await _todoListService.todoList();
      return data;
    } catch (error) {
      throw Exception('Failed to login_repositroy: $error');
    }
  }
}
