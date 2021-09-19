import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_original/Screens/plus.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';


class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('008080'),
      body: ListView(
        

          children: <Widget>[
              InkWell(
                onTap:(){} ,
                child: UserAccountsDrawerHeader(
                  accountName: Text('C Vinay Sankar',style: TextStyle(fontSize: 20),),
                  accountEmail: Text('vinaysankar30@gmail.com',style: TextStyle(fontSize: 16),),
                   currentAccountPicture: CircleAvatar(
                     backgroundColor: Colors.red,
                        // backgroundImage: ExactAssetImage(),
                    ),


                  decoration: BoxDecoration(
                    color: HexColor('008080'),
                  
                ),),
              ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.only(topRight: Radius.circular(25), 
            //           topLeft: Radius.circular(25)),
            //     color: Colors.green[100]
            //   ),
            //   child:
              Padding(
                padding: const EdgeInsets.only(left:5 ),
                child: Column(children: [
                  SizedBox(height: 13,),
             TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.green,
               onTap: (){
                  Feedback.forTap(context);
               },
               child: ListTile(
                   
                    title: Text('Profile',style: TextStyle(
                      color: Colors.white,
                      
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(FontAwesomeIcons.userAlt,color: Colors.white,),
                   
                    ),
             ),



                TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.grey,
               onTap: (){
                  Feedback.forTap(context);
               },
                  child: ListTile(
                    title: Text('Share Note',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(FontAwesomeIcons.share,color: Colors.white),
                
                    ),
                ),





              TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.grey,
               onTap: (){
                  Feedback.forTap(context);
               },
                  child: ListTile(
                    title: Text('Settings',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(FontAwesomeIcons.tools,color: Colors.white),
                   
                    ),
                ),

      

                TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.grey,
               onTap: (){
                  Feedback.forTap(context);
               },
                  child: ListTile(
                    title: Text('About Us',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(Icons.people,color: Colors.white),
                 
                    ),
                ),

      
          

               TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.grey,
               onTap: (){
                  Feedback.forTap(context);
                  Navigator.of(context).pop();
               },
                  child: ListTile(
                    title: Text('Close',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(FontAwesomeIcons.windowClose,color: Colors.white),
                    
                    ),
                ),



               TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.grey,
               onTap: (){
                  Feedback.forTap(context);
                  Navigator.of(context).pop();
               },
                  child: ListTile(
                    title: Text('Report a Bug',style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(FontAwesomeIcons.bug,color: Colors.white),
                    
                    ),
                ),
          ],
          ),
              ),

          ],
        ),
      );
  }
    
  }
    
