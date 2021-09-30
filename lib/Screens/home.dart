import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_original/Models/Providers/TodoModel.dart';
import 'package:intl/intl.dart';
import 'package:todo_original/Models/TaskModel.dart';
import 'package:todo_original/Models/swipeleft.dart';
import 'package:todo_original/Models/swiperight.dart';
import 'package:todo_original/Models/view.dart';
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
  final _formKey = GlobalKey<FormState>(); 
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
    return DateFormat('dd/MM/yyy').format(date);
  }
  Future<void> _refresh(BuildContext context) async{
    await Provider.of<TodoModel>(context,listen: false).fetchandSet();
  }
_message(){
  return  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Padding(
              padding: const EdgeInsets.only(left: 141),
              child: const Text("Updated"),
            )));
}
Widget build(BuildContext context) {

    // TODO: implement build
    return Stack(children: [
      DrawerScreen(),
       AnimatedContainer(
        decoration: BoxDecoration(
          border:isDrawerOpen? Border.all(color: Colors.black,width: 2):Border.all(color: Theme.of(context).primaryColor),
          color: Colors.yellow[50],
          borderRadius: BorderRadius.circular(40)
        ),
        transform: Matrix4.translationValues(xOffset,yOffset,0)..scale(scaleFactor)..rotateY(isDrawerOpen? -0.5:0),
        duration: Duration(milliseconds: 250),
        child: ClipRRect(borderRadius: BorderRadius.circular(isDrawerOpen? 40:0.0),
          child: Scaffold(
            backgroundColor: HexColor('#008080'),
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
            body: RefreshIndicator( onRefresh: ()=>_refresh(context).then((_) => 
           _message()
            ),
            
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
                    child:ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                      child: Scaffold(
                       backgroundColor: HexColor('#98D7C2'),
                        body: Consumer<TodoModel>(
                          builder: (context, todo, child){
                            return _isLoading? Center(child: 
                            CircularProgressIndicator(backgroundColor: Colors.black12,)
                            )
                            :ListView.builder(
                                itemCount:todo.tasklist.length,
                                itemBuilder: (context, index){
                                  TextEditingController updatenameController = TextEditingController(text: todo.tasklist[index].title);
                                  TextEditingController updatecontentController = TextEditingController(text: todo.tasklist[index].detail);
                                  final item = todo.tasklist;
                                  return Dismissible(
                                    background: slideRightBackground(),
                                    secondaryBackground: slideLeftBackground(),
                                    key: Key(item.toString()),
                                    child: Column(children: [
                                      SizedBox(height: 10,),
                                      Card(
                                        elevation: 10,
                                        color: HexColor('#DDFFE7'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)

                                        ),
                                        child: ListTile(
                                          onTap: (){
                                            showDialog(context: context, builder: (BuildContext context){
                                              return viewList(
                                                todo.tasklist[index].title,
                                                todo.tasklist[index].detail,
                                                todo.tasklist[index].date,
                                                todo.tasklist[index].time,
                                              );
                                            });
                                          
                                          },
                                          contentPadding: EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
                                          title: Text(todo.tasklist[index].title, style : TextStyle(color: Colors.black87,
                                              fontWeight: FontWeight.bold),),
                                          subtitle: Text(todo.tasklist[index].detail, style: TextStyle(color: Colors.black45,
                                              fontWeight: FontWeight.bold),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              ),
                                            
                                          trailing:   Container(
                                            padding: EdgeInsets.only(left: 20),
                                            decoration: BoxDecoration(border: Border(left: BorderSide(
                                              
                                              color: Colors.black

                                            ))),
                                            child: Column(
                                              children: [
                                                
                                                 Icon(Icons.check_circle, color: Colors.greenAccent,),
                                                 SizedBox(
                                                   height: 14,
                                                 ),
                                                Text(todo.tasklist[index].date, style : TextStyle(color: Colors.black,
                                                fontWeight: FontWeight.bold,fontSize: 8),),
                                                Text(todo.tasklist[index].time, style : TextStyle(color: Colors.black,
                                                fontWeight: FontWeight.bold,fontSize: 8,),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                                      ),]
                                    ),
                                    // ignore: missing_return
                                    confirmDismiss: (direction) async {
                                      if (direction == DismissDirection.endToStart) {
                                      
                                            final bool res = await showDialog(
                                              context: context,
                                          builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor: HexColor('#DDFFE7'),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                                    ),
                                          content: Container(
                                            height: 50,
                                            child: Column(
                                              children: [
                                               Text(
                                              "Are you sure you want to delete :",style: TextStyle(fontSize:18),),
                                              Text("${todo.tasklist[index].title}?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),overflow: TextOverflow.ellipsis,)
                                              ]),
                                          ),
                                               actions: <Widget>[
                               // ignore: deprecated_member_use
                               FlatButton(
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black,fontSize: 16),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red,fontSize: 16),
                          ),
                          onPressed: (
                            
                          ) {
                          
                            setState(() {
                              item.removeAt(index);
                             Provider.of<TodoModel>(context,listen: false).deleteContent(todo.tasklist[index].id);
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.only(left: 141),
                                  child: Text('deleted'),
                                )));
                             
                            }
                            );
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
              return res;
            } else {
              await showDialog(
                
                context: context,
                builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(50),
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(32),bottomLeft: Radius.circular(32),bottomRight: Radius.circular(32))),

                    content: Stack(
                      clipBehavior: Clip.none, children: <Widget>[
                        Card(
              elevation: 10,
              color: HexColor('#DDFFE7'),
                    shape: RoundedRectangleBorder(
                      
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(32),bottomLeft: Radius.circular(32),bottomRight: Radius.circular(32))),
                    
                    child:Form(
                      child: Container(
                        key: _formKey,
                          
                          width: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                               
                                    
                      
                                     Padding(
                                       padding: const EdgeInsets.only(left: 75,right: 75),
                                       child: Container(
                                        child: TextFormField(
                                          controller: updatenameController,
                                          validator: (value) {
                                                 if (value == null || value.isEmpty) {
                                                      return 'Please enter name';
                                                   }
                                                           return null;
                                                    },
                                          
                                        decoration: InputDecoration
                                         (
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
                                child: TextFormField(
                                 controller: updatecontentController,
                                  validator: (value) {
                                    
                                  if (value == null || value.isEmpty) {
                                      return 'Please enter detail';
                                  }
                                      return null;
                                  },
                                  //initialValue: todo.tasklist[index].detail,
                                  decoration: InputDecoration(
                                    
                                    border: InputBorder.none,
                                  ),
                                  maxLines: 10,
                                  
                                ),
                                
                              ),
                              GestureDetector(
                                onTap:(){
                                  
                                   Provider.of<TodoModel>(context,listen: false).updateTaskInList(todo.tasklist[index].id,
                                  
                                 TaskModel(
                                      title: updatenameController.text.toString(),
                                      detail: updatecontentController.text.toString(),

                                    ));
                                  
                                   Feedback.forTap(context);
                                   Navigator.of(context).pop();
                                  
                                _message();
                                
                                },
                                
                                child: Container(
                                  
                                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                                  decoration: BoxDecoration(
                                    
                                    color: HexColor('#29A0B1'),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(32.0),
                                        bottomRight: Radius.circular(32.0)),
                                  ),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                    ),
                    Positioned(
                          right: -5.0,
                          top: -10.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
            
                    ],
                    ),
                  );

                                          });


            }
                                    });
                                }
                            );
                          },
                        )


                      ),
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