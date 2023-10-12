import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:first_flutter_project/Tool+Extension/string_extension.dart';
import 'package:first_flutter_project/ViewModel/tododetail_viewmodel.dart';

class TodoDetailView extends StatelessWidget {
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return TodoDetailView();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
        child: SingleChildScrollView(
        child: Column(
          children: [
            Text('aaaa', style: TextStyle(fontSize: 30)),
            Text('aaaa', style: TextStyle(fontSize: 30)),
            Text('aaaa', style: TextStyle(fontSize: 30)),
            Text('aaaa', style: TextStyle(fontSize: 30)),
            Text('aaaa', style: TextStyle(fontSize: 30)),
            Text('aaaa', style: TextStyle(fontSize: 30)),
            Text('aaaa', style: TextStyle(fontSize: 30)),
            Text('aaaa', style: TextStyle(fontSize: 30)),
            Text('aaaa', style: TextStyle(fontSize: 30)),
            Text('aaaa', style: TextStyle(fontSize: 30)),
            Text('aaaa', style: TextStyle(fontSize: 30)),
            Text('aaaa', style: TextStyle(fontSize: 30)),
            Text('bbbbb', style: TextStyle(fontSize: 30)),
            Text('bbbbb', style: TextStyle(fontSize: 30)),
            Text('bbbbb', style: TextStyle(fontSize: 30)),
            Text('bbbbb', style: TextStyle(fontSize: 30)),
            Text('cccccc', style: TextStyle(fontSize: 30)),
            Text('bbbbb', style: TextStyle(fontSize: 30)),
            Text('cccc', style: TextStyle(fontSize: 30)),
            Text('bbbbb', style: TextStyle(fontSize: 30)),
            Text('cccc', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}


