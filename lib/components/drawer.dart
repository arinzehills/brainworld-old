import 'package:brainworld/components/gradient_text.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/home_page.dart';
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class MyDrawer extends StatefulWidget {
  // final String uid;
  // final String name;
  // final String email;
  // final String phone;
  

   MyDrawer({Key? key, }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _selectedIndex=0;
   _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }
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
                      colors:_selectedIndex==0 ? [ homepageBlue,homepageLightBlue]
                          : [Colors.white,Colors.white],
                      ),
                    ),
                ),
                onTap: () => {  
                    setState(() {
                    _selectedIndex = 0;
                  }),
                  print('index $_selectedIndex'),
                  MyNavigate.navigatejustpush(HomePage(), context)
                  
                  },
                  selected: _selectedIndex==0,
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
                      colors: _selectedIndex==0? [ homepageBlue,homepageLightBlue]
                          : [Colors.white,Colors.white],
                          ),
                    ),
                ),
                onTap: () => { 
                    setState(() {
                    _selectedIndex = 1;
                  }),
                  print('index:$_selectedIndex'),
                  
                  MyNavigate.navigatejustpush(HomePageNavagation(), context)
                  
                  },
                selected: _selectedIndex==1,
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
                        colors: _selectedIndex==0 ? [ homepageBlue,homepageLightBlue]
                          : [Colors.white,Colors.white],),
                      ),
                  ),
                   selected: _selectedIndex==2,
                  onTap: () => { 
                    print('index:$_selectedIndex'),              
                  
                     MyNavigate.navigatepushuntil(HomePageNavagation(index: 1,), context),
                     setState(() {
                    _selectedIndex = 2;
                  }),
                     },
                     
                
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
                      colors: _selectedIndex==0 ? [ homepageBlue,homepageLightBlue]
                          : [Colors.white,Colors.white],
                          ),
                    ),
                ),
                onTap: () => { 
                  _onSelected(3),
                  print(_selectedIndex),
                   MyNavigate.navigatepushuntil(HomePageNavagation(index: 2,), context)
                   
                   },
                selected: _selectedIndex==3,
              ),
              ListTile(
                // leading: Icon(Icons.input,color:Colors.red,),
                title: Center(
                  child: GradientText('Library ',
                    style: const TextStyle(
                      fontSize: 30
                      ),
                   gradient: LinearGradient(
                       begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: _selectedIndex==0? [ homepageBlue,homepageLightBlue]
                          : [Colors.white,Colors.white],
                          ),
                    ),
                ),
                onTap: () => {
                    setState(() {
                    _selectedIndex = 4;
                  }),
                    MyNavigate.navigatepushuntil(HomePageNavagation(index: 3,), context)
                    
                    },
                    selected: _selectedIndex==4,
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
                      colors: _selectedIndex==0 ? [ homepageBlue,homepageLightBlue]
                          : [Colors.white,Colors.white],) ,
                    ),
                ),
                onTap: () => { 
                    setState(() {
                    _selectedIndex = 5;
                  }),
                   MyNavigate.navigatejustpush(HomePage(), context)
                   
                   },
                   selected: _selectedIndex==5,
              ),
            ]
          ),
        );
        
       }
       
}