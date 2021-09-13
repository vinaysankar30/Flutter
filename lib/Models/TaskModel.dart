import 'package:flutter/cupertino.dart';
import '../Screens/plus.dart';

class TaskModel {
  String title;
  String detail;
 
 
  String get getTitle => title;
  String get getDetail => detail;
 
    TaskModel(this.title,this.detail,);
}