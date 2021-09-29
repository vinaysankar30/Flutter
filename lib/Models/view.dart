import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget viewList(){
return AlertDialog(
  backgroundColor: Colors.transparent,
  insetPadding: EdgeInsets.zero,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(31)
  ),
  contentPadding: EdgeInsets.zero,
    content: Stack(children: [
      Container(
        
        height: 485,
        width: 280,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(31),
        color: HexColor('#DDFFE7'),
         boxShadow: [
        BoxShadow(
        color: Colors.grey.withOpacity(0.8),
        spreadRadius: 1,
        blurRadius: 1,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ],
        ),
      ),
    Positioned(
                          right: 10.0,
                          top: 10.0,
                          child: InkResponse(
                            onTap: () {
                              
                            },
                            child: CircleAvatar(
                              
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),

    ],)
   
      
);
}