import 'package:get/get.dart';

import '../Model/todo_model.dart';
import '../Services/todo_service.dart';

class TodoRepository {
  final TodoService _todoListService = Get.put(TodoService());

  Future<List<TodoListResponse>> getTodoList() async {
    try {
      final data = await _todoListService.todoList();
      return data;
    } catch (error) {
      throw Exception('Failed to login_repositroy: $error');
    }
  }

  Future<TodoListResponse> getTodoDetail(int id) async {
    try {
      final data = await _todoListService.getTodoDetail(id);
      return data;
    } catch (error) {
      throw Exception('Failed to get todo detail: $error');
    }
  }

}
