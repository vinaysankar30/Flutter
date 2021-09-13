import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../Screens/home.dart';
import '../Screens/plus.dart';
import '../Screens/games.dart';
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedpage = 0;
  List listWidgets = [
    Home(),
    MyApp(),
    Games(),
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body:listWidgets[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        items: [
          TabItem(icon: Icons.home),
          TabItem(icon: Icons.add),
          TabItem(icon: Icons.search)
        ],
        activeColor: Colors.white,
        initialActiveIndex: 1,
        onTap: (int i){
          setState(() {
           selectedpage = i;  
          });
        },
      ),
      );
}}