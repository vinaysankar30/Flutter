import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Games extends StatelessWidget{
  static const routeName = 'text';

@override
Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor('#008080'),
      body: Center(
          child: Text('Games',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
      ),
    );
}

}