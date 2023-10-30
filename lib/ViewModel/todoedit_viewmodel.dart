import 'package:first_flutter_project/Model/todo_model.dart';
import 'package:first_flutter_project/View/tododetail_view.dart';
import 'package:first_flutter_project/View/todoedit_view.dart';
import 'package:get/get.dart';
import '../Repositories/todo_repository.dart';
import '../View/todo_view.dart';

class TodoEditViewModel extends GetxController {
  var isLoading = false.obs;

  final TodoRepository _todoRepository = Get.put(TodoRepository());

  void putTodo(int id ,String title, String description, int priority) async {
    try {
      isLoading(true);
      var data = await _todoRepository.putTodo(id, title, description, priority, false);
      Get.offAll(TodoView());
    } catch (error) {
      print('Failed from viewmodel');
    } finally {
      isLoading(false);
    }
  }
}