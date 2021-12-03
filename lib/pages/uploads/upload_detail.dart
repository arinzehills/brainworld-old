import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/mylist_container.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:flutter/material.dart';

import '../home_page_navigation.dart';

class UploadDetail extends StatefulWidget {
  const UploadDetail({ Key? key }) : super(key: key);

  
  @override
  _UploadDetailState createState() => _UploadDetailState();
}
class UserData{
  String title;
  IconData? leading;
  UserData({required this.title, this.leading});

}
class _UploadDetailState extends State<UploadDetail> {

    List<UserData> title =[
    UserData(title: 'title',leading: Icons.person),
    UserData(title: 'phone',leading: Icons.mobile_friendly),
    UserData(title: 'email',leading: Icons.email_outlined),
    UserData(title: 'address',leading: Icons.location_on),


  
  ];
  
 String dropdownValue = 'Select Category';
   final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
    
    return Scaffold(
      drawer: MyDrawer(),
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: homepageBlue,
        leading:IconButton(
                onPressed: ()=> {                 
                    _scaffoldKey.currentState!.openDrawer()                   
                   },
              icon: ImageIcon(
                  AssetImage('assets/menu_white.png'),
                    size: 30,
                    color: Colors.white,
                  ),
              ),
        
        ),
      body:  SingleChildScrollView(
                child: Builder(
                builder:(context)=> Column(
                  children: [
                      SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: size.height* 0.4,
                                    decoration: new BoxDecoration(
                                    color: Colors.transparent,
                                      image: new DecorationImage(
                                        image: AssetImage(
                                            "assets/coding.jpg"),
                                        fit: BoxFit.scaleDown,
                                      ),
                                    )
                                  ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,   ),
                                          child: Text(
                                            'Learn Python Programming Masterclass',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25,
                                            ),
                                ),
                                        ),
                                         Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'This Python For Beginners Course Teaches '
                                            'You The Python Language Fast. Includes Python Online Training With Python 3 ',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                            style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                            ),
                                              ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                              Icons.lock_clock,
                                              ),
                                               Text(
                                              'Last updated 11/2021  ',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 4,
                                              style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                              ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0, top: 20),
                                          child: Text(
                                            'Videos',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25,
                                              ),
                                           ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10).copyWith(top:15),
                                        child: Text('No videos for this contents'),),
                                        // ?? BasicTilePage(),
                                        Padding(
                                              padding: const EdgeInsets.only(left: 8.0, top: 20),
                                              child: Text(
                                                'Files',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 25,
                                                  ),
                                              )
                                         ),
                               ListView.builder(
                                 itemCount: 4,
                                 shrinkWrap: true,
                                 padding: EdgeInsets.only(top: 10,bottom: 10),
                                 physics: NeverScrollableScrollPhysics(),                                 
                                 itemBuilder: (context, index){
                                   return   Card(
                                     child: ListTile(

                                              title: Text('title'),
                                                leading: Icon(
                                                    Icons.picture_as_pdf,
                                                    color: Colors.red,                                   
                                                  ),
                                                  trailing: Icon(Icons.more_vert),
                                            ),
                                   );
                                 }
                                 ),
                                ],
                              )
                            ),
                          )
                  ],
                ),
                          ),
              ),
            
      );

  }
}