import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_original/Models/Providers/TodoModel.dart';
import 'package:intl/intl.dart';
import 'package:todo_original/Screens/drawer.dart';
class Home extends StatefulWidget{
 
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  String _timeString;
  String _date;
  var _isLoading = true;
@override
void initState() {
    Provider.of<TodoModel>(context,listen: false).fetchandSet().then((_) => {
      setState((){
        _isLoading = false;
      })
    });
    _timeString = _formatTime(DateTime.now());
    _date = _formatedDate(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }
void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = _formatTime(now);
    final String date = _formatedDate(now);
    setState(() {
      _timeString = formattedTime;
      _date = date;
    });
  }
  String _formatTime(DateTime dateTime) {
    return DateFormat('kk:mm:ss').format(dateTime);
  }
  String _formatedDate(DateTime date){
    return DateFormat('MM/dd/yyy').format(date);
  }
  Future<void> _refresh(BuildContext context) async{
    await Provider.of<TodoModel>(context,listen: false).fetchandSet();
  }

Widget build(BuildContext context) {

    // TODO: implement build
    return Stack(children: [
      DrawerScreen(),
       AnimatedContainer(
        decoration: BoxDecoration(
          border:isDrawerOpen? Border.all(color: Colors.black,width: 3):Border.all(color: Theme.of(context).primaryColor),
          color: Colors.yellow[50],
          borderRadius: BorderRadius.circular(40)
        ),
        transform: Matrix4.translationValues(xOffset,yOffset,0)..scale(scaleFactor)..rotateY(isDrawerOpen? -0.5:0),
        duration: Duration(milliseconds: 250),
        child: ClipRRect(borderRadius: BorderRadius.circular(isDrawerOpen? 40:0.0),
          child: Scaffold(
            backgroundColor: Colors.lightBlue[700],
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text("Todo Application", style: TextStyle(color: Colors.white),),
              leading: isDrawerOpen? IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: (){
                  setState(() {
                                  xOffset = 0;
                                  yOffset=0;
                                  scaleFactor = 1;
                                  isDrawerOpen = false;
                                });
                },
              ) :
              IconButton(icon: Icon(Icons.menu, color: Colors.white70,), onPressed: () { 

              setState(() {
                        xOffset = 230;
                        yOffset = 150;
                        scaleFactor = 0.6;
                        isDrawerOpen=true;
                      });
               },),
            ),
            body: RefreshIndicator( onRefresh: ()=>_refresh(context).then((_) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Updated")))),
            
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20,),

                              
                      Text( _timeString, style: TextStyle(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold),),

                      Padding(
                        padding: const EdgeInsets.only(left: 44),
                        child: Text(_date, style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),
                      ),

                      SizedBox(height: 20,)

                    ],
                  ), 
                  Expanded(
                    child:Container(

                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(60)), color: Colors.yellow[50]),
                      child: Consumer<TodoModel>(
                        builder: (context, todo, child){
                          return _isLoading? Center(child: 
                          CircularProgressIndicator(backgroundColor: Colors.black12,)
                          )
                          :ListView.builder(
                              itemCount: todo.tasklist.length,
                              itemBuilder: (context, index){
                                return Container(
                                
                                  child: ListTile(
                                    contentPadding: EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
                                    title: Text(todo.tasklist[index].title, style : TextStyle(color: Colors.black87,
                                        fontWeight: FontWeight.bold),),
                                    subtitle: Text(todo.tasklist[index].detail, style: TextStyle(color: Colors.black45,
                                        fontWeight: FontWeight.bold),),

                                    trailing: Icon(Icons.check_circle, color: Colors.greenAccent,),
                                  ),
                                  margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                                );
                              }
                          );
                        },
                      )


                    ),
                  )

                ],
              ),
            ),
            
            ),
        ),
      ),
    ]
    );



}
}