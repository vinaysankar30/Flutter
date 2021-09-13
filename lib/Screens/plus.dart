import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:todo_original/Models/Providers/TodoModel.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:todo_original/Models/TaskModel.dart';

void main() {
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String name;
  String content;
  final _formKey = GlobalKey<FormState>();
   var _isLoading = false;
   @override
   void initState() {
       // TODO: implement initState
       super.initState();
     }
  @override
  Widget build(BuildContext context) {
  
    return  AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 75,right: 75),
                      child: Container(
                        
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration
                         (hintText:'Enter Activity Name',
                         border: InputBorder.none
                        ),
                        
                      ),
                  ),
                    ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      controller: contentController,
                      decoration: InputDecoration(
                        hintText: "Add Review",
                        border: InputBorder.none,
                      ),
                      maxLines: 10,
                    ),
                  ),
                  GestureDetector(
                    onTap:(){Provider.of<TodoModel>(context,listen: false).
                    
                    addTaskInList(
                      TaskModel(nameController.text.toString(),
                      contentController.text.toString()
                      
                      )
                      );
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('saved'),
                    ));
                    },
                    
                    child: Container(
                      
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
  }
  
  