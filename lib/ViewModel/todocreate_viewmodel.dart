import 'package:first_flutter_project/Model/todo_model.dart';
import 'package:get/get.dart';
import '../Repositories/todo_repository.dart';

class TodoCreateViewModel extends GetxController {
  var isLoading = false.obs;

  final TodoRepository _todoRepository = Get.put(TodoRepository());

  void postTodo(String title, String description, int priority) async {
    try {
      isLoading(true);
      var data = await _todoRepository.postTodo(title, description, priority);
      // data
    } catch (error) {
      print('Failed from viewmodel');
    } finally {
      isLoading(false);
    }
  }
}