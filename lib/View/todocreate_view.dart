import 'package:first_flutter_project/ViewModel/todocreate_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TodoCreateView extends StatefulWidget {

  @override
  _TodoCreateViewState createState() => _TodoCreateViewState();
}

class _TodoCreateViewState extends State<TodoCreateView> {
  final TodoCreateViewModel _viewModel = Get.put(TodoCreateViewModel());

  TextEditingController _titleTextValue = TextEditingController();
  TextEditingController _descriptionTextValue = TextEditingController();

  Priority _priorityValue = Priority.low;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Todo'),
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
                Priority.low,
                Priority.medium,
                Priority.high,
                Priority.veryhigh,
                Priority.critical,
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
                  _viewModel.postTodo(_titleTextValue.text, _descriptionTextValue.text, _priorityValue.value);
                },
                child: Text('Create!'),
              ),
            ),
          ],
        ),
      ),
    );
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
