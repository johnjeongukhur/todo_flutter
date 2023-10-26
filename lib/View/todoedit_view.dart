import 'package:first_flutter_project/View/todo_view.dart';
import 'package:first_flutter_project/ViewModel/todoedit_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TodoEditView extends StatefulWidget {
  final int id;

  TodoEditView({required this.id});

  @override
  _TodoEditViewState createState() => _TodoEditViewState();
}

class _TodoEditViewState extends State<TodoEditView> {

  final TodoEditViewModel _viewModel = Get.put(TodoEditViewModel());

  TextEditingController _titleTextValue = TextEditingController();
  TextEditingController _descriptionTextValue = TextEditingController();

  Priority _priorityValue = Priority.low;

  @override
  void initState() {
    super.initState();
    // _viewModel.getAllTodo();
  }

  @override
  Widget build(BuildContext context) {
    int id = widget.id;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _titleTextValue,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                  hintText: 'Write your Todo Title'
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              child: SingleChildScrollView(
                child: TextField(
                  controller: _descriptionTextValue,
                  maxLines: 8,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                      hintText: 'Write your Todo Detail'
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<Priority>(
              value: _priorityValue,
              onChanged: (Priority? newValue) {
                setState(() {
                  _priorityValue = newValue ?? Priority.low;
                });
              },
              items: [
                Priority.critical,
                Priority.veryhigh,
                Priority.high,
                Priority.medium,
                Priority.low,
              ].map<DropdownMenuItem<Priority>>((Priority priority) {
                return DropdownMenuItem<Priority>(
                  value: priority,
                  child: Text('${priority.title}'),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Priority'),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  _viewModel.putTodo(id, _titleTextValue.text, _descriptionTextValue.text, _priorityValue.value);
                },
                child: Text('Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
