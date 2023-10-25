import 'package:get/get.dart';

import '../Model/todo_model.dart';
import '../Services/tododetail_service.dart';

class TodoDetailRepository {
  final TodoDetailService _todoDetailService = Get.put(TodoDetailService());

  Future<TodoListResponse> getTodoDetail(int id) async {
    try {
      final data = await _todoDetailService.getTodoDetail(id);
      return data;
    } catch (error) {
      throw Exception('Failed to get todo detail: $error');
    }
  }
}