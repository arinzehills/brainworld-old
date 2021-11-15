
import 'package:brainworld/authentications/user/dashboard.dart';
import 'package:brainworld/components/gradient_text.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/pages/chat.dart';
import 'package:brainworld/home_page.dart';
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:brainworld/pages/library.dart';
import 'package:brainworld/pages/uploads.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class MyDrawer extends StatelessWidget {
  // final String uid;
  // final String name;
  // final String email;
  // final String phone;
  

   MyDrawer({Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // final user= Provider.of<Users>(context);
    //  var myred=Color(MyApp().myred);
        
        return Drawer(
          
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.cancel),
                          color: Colors.white,
                           onPressed: (){
                             Navigator.of(context).pop();
                           }
                            ),
                        Padding(  
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 190,
                            child: Wrap(
                                     children: [
                                Text(
                                 'Arinze hills',
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white, fontSize: 25,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         SizedBox(
                            width: 190,
                            child: Wrap(
                                     children: [
                                 SizedBox(
                            width: 190,
                            child: Wrap(
                                     children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:30.0),
                                  child: Text(
                                   '',
                                   maxLines: 1,
                                   overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white, fontSize: 15,),
                                    ),
                                ),
                                 
                              ],
                            ),
                          ),
                         
                          
                              ],
                            ),
                          ),
                       ],
                     ),
                  ],
                ),
                
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                     begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                    const Color(0xff00dcff),
                    const Color(0xff0837ff),                    
                  ]),
                    
                        ),
                 ),
              ListTile(
                // leading: Icon(Icons.input,color:Colors.red,),
                title: Center(
                  child: GradientText('Home ',
                    style: const TextStyle(
                      fontSize: 30
                      ),
                   gradient: LinearGradient(
                       begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                      welcomepageBlue,
                      welcomepageLightBlue,                    
                    ]),
                    ),
                ),
                onTap: () => {  MyNavigate.navigatejustpush(HomePage(), context)},
              ),
              ListTile(
                // leading: Icon(Icons.input,color:Colors.red,),
                title: Center(
                  child: GradientText('Dashboard ',
                    style: const TextStyle(
                      fontSize: 30
                      ),
                   gradient: LinearGradient(
                       begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                      welcomepageBlue,
                      welcomepageLightBlue,                    
                    ]),
                    ),
                ),
                onTap: () => { MyNavigate.navigatejustpush(HomePageNavagation(), context)},
              ),
             ListTile(
                // leading: Icon(Icons.input,color:Colors.red,),
                title: Center(
                  child: GradientText('Chat ',
                    style: const TextStyle(
                      fontSize: 30
                      ),
                   gradient: LinearGradient(
                       begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                      welcomepageBlue,
                      welcomepageLightBlue,                    
                    ]),
                    ),
                ),
                onTap: () => {  MyNavigate.navigatejustpush(Chat(), context)},
              ),
              ListTile(
                // leading: Icon(Icons.input,color:Colors.red,),
                title: Center(
                  child: GradientText('Uploads ',
                    style: const TextStyle(
                      fontSize: 30
                      ),
                   gradient: LinearGradient(
                       begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                      welcomepageBlue,
                      welcomepageLightBlue,                    
                    ]),
                    ),
                ),
                onTap: () => {  MyNavigate.navigatejustpush(Uploads(), context)},
              ),ListTile(
                // leading: Icon(Icons.input,color:Colors.red,),
                title: Center(
                  child: GradientText('Library ',
                    style: const TextStyle(
                      fontSize: 30
                      ),
                   gradient: LinearGradient(
                       begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                      welcomepageBlue,
                      welcomepageLightBlue,                    
                    ]),
                    ),
                ),
                onTap: () => {  MyNavigate.navigatejustpush(Library(), context)},
              ),ListTile(
                // leading: Icon(Icons.input,color:Colors.red,),
                title: Center(
                  child: GradientText('Create a class room ',
                    style: const TextStyle(
                      fontSize: 30
                      ),
                   gradient: LinearGradient(
                       begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                      welcomepageBlue,
                      welcomepageLightBlue,                    
                    ]),
                    ),
                ),
                onTap: () => {  MyNavigate.navigatejustpush(HomePage(), context)},
              ),
            ]
          ),
        );
       }
      
      
    
  
}