

import 'package:flutter/cupertino.dart';
import 'package:todo_original/Models/TaskModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class TodoModel extends ChangeNotifier{
  List tasklist = [];
   var url = Uri.parse('https://todoapp-72f66-default-rtdb.firebaseio.com/mynotes.json');
  
  Future<void> addTaskInList(TaskModel taskModel) async {
   http.post(url,body:jsonEncode({
      'title':taskModel.title,
      'detail':taskModel.detail,
      'time':taskModel.time,
      'date':taskModel.date,
    })
    );
    
      notifyListeners();
      
  }
  Future<void> fetchandSet() async{
    final response = await http.get(url);
    final extractedData = jsonDecode(response.body) as Map<String,dynamic>;
    print(extractedData);
    final List<TaskModel>loaded = [];
    extractedData.forEach((key, value) {
      loaded.add(TaskModel(
        title: value['title'],
        detail: value['detail'],
        time: value['time'],
        date: value['date'],
        id:key
      )
        );
    });
    tasklist = loaded;
    notifyListeners();
   
    
  }
  Future<void> deleteContent(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://todoapp-72f66-default-rtdb.firebaseio.com/mynotes/$id.json'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    
  );
 notifyListeners();
  
  
}

Future<void> UpdateTaskInList(String id,TaskModel taskModel) async {
  var url = Uri.parse('https://todoapp-72f66-default-rtdb.firebaseio.com/mynotes/$id.json');
   http.post(url,body:jsonEncode({
      'title':taskModel.title,
      'detail':taskModel.detail,
      'time':taskModel.time,
      'date':taskModel.date,
    })
    );
    
      notifyListeners();
      
  }
}