import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      backgroundColor: Colors.lightBlue[700],
      body: ListView(
        
          padding: EdgeInsets.all(0.0),
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
                    color: Colors.lightBlue[700],
                  // image: DecorationImage(
                    // image: AssetImage("assets/fundo.jpg"),
                      //  fit: BoxFit.cover)
                ),),
              ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(25), 
                      topLeft: Radius.circular(25)),
                color: Colors.green[100]
              ),
              child:
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(children: [
                  SizedBox(height: 15,),
             TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.grey,
               onTap: (){
                  Feedback.forTap(context);
               },
               child: ListTile(
                   
                    title: Text('Profile',style: TextStyle(
                      
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(FontAwesomeIcons.userAlt),
                   
                    ),
             ),
                  Divider(),
    
                
                TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.grey,
               onTap: (){
                  Feedback.forTap(context);
                  //Navigator.pushNamed(context, '/addNew');
                  Navigator.of(context).push( MaterialPageRoute(builder: 
                   (context) => MyApp()));
               },
                  child: ListTile(
                    title: Text('New Note',style: TextStyle(
                      
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(FontAwesomeIcons.plusCircle),
                    
                    ),
                ),

                Divider(),
           


                TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.grey,
               onTap: (){
                  Feedback.forTap(context);
               },
                  child: ListTile(
                    title: Text('Search',style: TextStyle(
                      
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(FontAwesomeIcons.search),
                  
                    ),
                ),


                Divider(),


                TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.grey,
               onTap: (){
                  Feedback.forTap(context);
               },
                  child: ListTile(
                    title: Text('Share Note',style: TextStyle(
                      
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(FontAwesomeIcons.share),
                
                    ),
                ),


      
                Divider(),


              TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.grey,
               onTap: (){
                  Feedback.forTap(context);
               },
                  child: ListTile(
                    title: Text('Settings',style: TextStyle(
                      
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(FontAwesomeIcons.tools),
                   
                    ),
                ),

                Divider(),
                

                TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.grey,
               onTap: (){
                  Feedback.forTap(context);
               },
                  child: ListTile(
                    title: Text('Support',style: TextStyle(
                      
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(Icons.report_problem),
                 
                    ),
                ),

      
                Divider(),

               TouchRippleEffect(
                borderRadius: BorderRadius.circular(25),
               rippleColor: Colors.grey,
               onTap: (){
                  Feedback.forTap(context);
                  Navigator.of(context).pop();
               },
                  child: ListTile(
                    title: Text('Close',style: TextStyle(
                      
                      fontWeight: FontWeight.bold,
                      
                      
                      )),
                    leading: Icon(FontAwesomeIcons.windowClose),
                    
                    ),
                ),
          ],
          ),
              ),
          ),
          ],
        ),
      );
  }
    
  }
    
