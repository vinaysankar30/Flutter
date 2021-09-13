

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
    final response = await http.post(url,body:jsonEncode({
      'title':taskModel.title,
      'detail':taskModel.detail
    }),).then((value) => tasklist.add(taskModel));
    
      notifyListeners();
  }
  Future<Void> fetchAndSet() async{
      var url = Uri.parse('https://todoapp-72f66-default-rtdb.firebaseio.com/mynotes.json');
      try{
      final response  = await http.get(url);
      var extractedData = json.decode(response.body);
      List <TaskModel> newData = [];
      for(var u in extractedData){
        TaskModel newtask = TaskModel(
          u['title'],
          u['detail'],
        );
          newData.add(newtask);
      
      }

      
      }catch(error){
        throw(error);
      }
      notifyListeners();
  }
}