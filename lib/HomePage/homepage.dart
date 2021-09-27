import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
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
        style: TabStyle.textIn,
        backgroundColor: HexColor('#167D7F'),
        items: [
          TabItem(icon: Icons.home,title: 'Home'),
          TabItem(icon: Icons.add,title: 'New'),
          TabItem(icon: Icons.search,title:'Search')
        ],
        activeColor: Colors.white,
        initialActiveIndex: 0,
        onTap: (int i){
          setState(() {
           selectedpage = i;  
          });
        },
      ),
      );
}}