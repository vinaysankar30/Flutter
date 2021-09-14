


import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:todo_original/Models/TaskModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class TodoModel extends ChangeNotifier{
  List tasklist = [];
  Future<void> addTaskInList(TaskModel taskModel) async {
  var url = Uri.parse('https://todoapp-72f66-default-rtdb.firebaseio.com/mynotes.json');
// .then((value) => tasklist.add(taskModel)
   http.post(url,body:jsonEncode({
      'title':taskModel.title,
      'detail':taskModel.detail
    }),);
    
      notifyListeners();
  }
  Future<Void> fetchandSet() async{
    var url = Uri.parse('https://todoapp-72f66-default-rtdb.firebaseio.com/mynotes.json');
    final response = await http.get(url);
    final extractedData = jsonDecode(response.body) as Map<String,dynamic>;
    final List<TaskModel>loaded = [];
    extractedData.forEach((key, value) {
      loaded.add(TaskModel(
        title: value['title'],
        detail: value['detail'],
      )
        );
    });
    tasklist = loaded;
    notifyListeners();
   
    
  }
}