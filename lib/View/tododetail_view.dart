import 'package:first_flutter_project/View/todo_view.dart';
import 'package:first_flutter_project/View/todoedit_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:first_flutter_project/Tool+Extension/string_extension.dart';
import 'package:first_flutter_project/ViewModel/tododetail_viewmodel.dart';

class TodoDetailView extends StatefulWidget {
  final int id;

  TodoDetailView({required this.id});

  @override
  _TodoDetailViewState createState() => _TodoDetailViewState();

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return TodoDetailView(id: id);
      },
    );
  }
}

class _TodoDetailViewState extends State<TodoDetailView> {
  final TodoDetailViewModel _viewModel = Get.put(TodoDetailViewModel());

  @override
  void initState() {
    super.initState();
    _viewModel.getDetailTodo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.id;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              return Stack(children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: getPriorityColor(
                                    _viewModel.todo.value?.priority ?? 0),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${_viewModel.todo.value?.title}',
                              style: const TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          children: [
                            Text(
                              _viewModel.todo.value?.createdAt.timeAgoSinceNow() ?? '',
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 13.0,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(_viewModel.todo.value?.description ?? '')
                          ],
                        )
                      ],
                    )),
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*6.5/10,),
                    Row(
                      children: [
                        Spacer(),
                        FloatingActionButton(
                          onPressed: () {
                            Get.to(() => TodoEditView(
                              id: id,
                              title: _viewModel.todo.value?.title ?? '',
                              description: _viewModel.todo.value?.description ?? '',
                              priority:  _viewModel.todo.value?.priority ?? 1,
                            ));
                          },
                          child: Icon(Icons.edit),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                )
              ]);
            })
          ],
        ),
      ),
    );

  }
}


