import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_original/Screens/drawer.dart';
import 'package:todo_original/Screens/games.dart';
import 'package:todo_original/Screens/home.dart';
import 'package:todo_original/Screens/plus.dart';

import 'HomePage/homepage.dart';
import 'Models/Providers/TodoModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.black12,
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => TodoModel(),
        child: 
          MyHomePage(),
        ),
        routes: {
          '/addNew':(context)=>MyApp(),
          Games.routeName:(context)=>Games()
        },
    );
  }
}