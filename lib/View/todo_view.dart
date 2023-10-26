import 'package:first_flutter_project/Tool+Extension/string_extension.dart';
import 'package:first_flutter_project/View/todocreate_view.dart';
import 'package:first_flutter_project/View/tododetail_view.dart';
import 'package:first_flutter_project/ViewModel/todo_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../API/keychain.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final TodoViewModel _viewModel = Get.put(TodoViewModel());
  final TokenStorage _tokenStorage = TokenStorage();

  void _logout() async {
    await _tokenStorage.deleteToken();
    Get.offNamed('/login'); // Navigate to the login screen after logout
  }

  @override
  void initState() {
    super.initState();
    _viewModel.getAllTodo();
  }

  Future<void> _refreshTodoList() async {
    _viewModel.getAllTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshTodoList,
        child: Obx(() {
          if (_viewModel.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: _viewModel.todoList.length,
                  itemBuilder: (context, index) {
                    var todo = _viewModel.todoList[index];
                    Color priorityColor = getPriorityColor(todo.priority);

                    return ListTile(
                      contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
                      title: Wrap(
                        spacing: 8,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: priorityColor,
                            ),
                          ),

                          Baseline(
                            baseline: 15,
                            baselineType: TextBaseline.alphabetic,
                            child: Text(
                              todo.title,
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Text(
                            todo.createdAt.timeAgoSinceNow(),
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 13.0,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),

                        ],
                      ),
                      subtitle: Text(todo.description),
                      subtitleTextStyle: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                      onTap: () {
                        print('Todo 선택 ${todo.description}');
                        // Move to Detail view
                        TodoDetailView(id: todo.id).showBottomSheet(context);
                      },
                    );
                  },
                ),
                Positioned(
                  bottom: MediaQuery.of(context).padding.bottom + 20.0,
                  right: MediaQuery.of(context).size.width / 2 - 28,
                  child: FloatingActionButton(
                    onPressed: () {
                      Get.to(() => TodoCreateView());
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}


Color getPriorityColor(int priority) {
  switch (priority) {
    case 1:
      return Color(0xFF94B9EF);
    case 2:
      return Color(0xFF8CED90);
    case 3:
      return Color(0xFFF6EB80);
    case 4:
      return Color(0xFFEC9F67);
    case 5:
      return Color(0xFFED5C5C);
    default:
      return Color(0xFFD9D9D9);
  }
}

enum Priority {
  low(title: 'Low', value: 1),
  medium(title: 'Medium', value: 2),
  high(title: 'High', value: 3),
  veryhigh(title: 'Very High', value: 4),
  critical(title: 'Critical', value: 5);

  final String title;
  final int value;
  const Priority({
    required this.title,
    required this.value,
  });
}
