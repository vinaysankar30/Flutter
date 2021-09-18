import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
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
  DateTime now = DateTime.now();
  String time(){
    return DateFormat('kk:mm:ss').format(now);
  }
  String date(){
    return  DateFormat('dd/MM/yyy').format(now);
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String name;
  String content;
 

  @override
  Widget build(BuildContext context) {
  
    return  Container(
      child: Center(
        child: Card(
          elevation: 10,
          color: Colors.yellow[50],
                shape: RoundedRectangleBorder(
                  
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
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
                            TaskModel(title:nameController.text.toString(),
                            detail:contentController.text.toString(),
                            time:time(),
                            date:date()
                            
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
                ),
              ),
      ),
    );
  }
  }