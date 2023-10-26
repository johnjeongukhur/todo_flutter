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

  Future<void> postTodo(String title, String description, int priority) async {
    try {
      TodoListResponse newTodo = await _todoListService.postTodo(
        title: title,
        description: description,
        priority: priority,
        complete: false,
      );
      print('Todo created successfully! ID: ${newTodo.id}');
    } catch (error) {
      print('Failed to create todo: $error');
    }
  }

  Future<void> putTodo(int id, String title, String description, int priority) async {
    try {
      TodoListResponse newTodo = await _todoListService.putTodo(
        id: id,
        title: title,
        description: description,
        priority: priority,
        complete: false,
      );
      print('Todo edited successfully! ID: ${newTodo.id}');
    } catch (error) {
      print('Failed to create todo: $error');
    }
  }

}
