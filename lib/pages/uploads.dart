import 'package:brainworld/components/custom_sliver_delegate.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/components/mylist_container.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/loading.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/models/myuser.dart';
import 'package:brainworld/pages/uploads/course/upload_course_info.dart';
import 'package:brainworld/pages/uploads/upload_detail.dart';
import 'package:brainworld/pages/uploads/upload_files.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page_navigation.dart';
class Uploads extends StatefulWidget {
  const Uploads({ Key? key }) : super(key: key);

  @override
  _UploadsState createState() => _UploadsState();
}

class _UploadsState extends State<Uploads> {
  String uploadType='Files';

  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
    int empty=0;
    final user= Provider.of<MyUser>(context);
    String where='course';
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
            .collection('uploads')
            .doc(user.uid)
            .collection('user_uploads')
            // .where("courseType", isEqualTo: 'files')
            .orderBy('TimeStamp', descending:true)
            .snapshots() ,
      builder: (context, snapshot) {
        if(snapshot.hasData){

        return Scaffold(
          drawer: MyDrawer(),
          body: SafeArea(
              child: Stack(
                children: [
                  CustomScrollView(
                    slivers: <Widget>[
                      SliverPersistentHeader(
                          pinned: true,
                          floating: true,
                          delegate: CustomSliverDelegate(
                            expandedHeight: 149,
                            aligncontainerwidget: MyListContainer(
                              title: 'Total number of uploads',
                              sub_title: snapshot.data!.size.toString(),
                              ),
                            showaligncontainerwidget:true,
                            title: 'Uploads',
                            searchHint: 'uploads',
                            alignment: Alignment(0.0, 1.40),
                            curveContainerHeight: size.height * 0.33,
                          ),
                        ),
                      SliverToBoxAdapter(
                        child: Center(
                              child:  snapshot.data!.size==0 ? Padding(
                                          padding: const EdgeInsets.only(top:38.0),
                                          child: Container(
                                            height: size.height * 0.31,
                                         width: size.width*0.7,
                                        decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(100)),                
                                        boxShadow: [
                                                      BoxShadow(
                                                        color: welcomepageBlue.withOpacity(0.24),
                                                        // spreadRadius: 5,
                                                        blurRadius: 10,
                                                        offset: Offset(0, 5), // changes position of shadow
                                                      ),
                                                    ],
                                        gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [ Colors.white,Colors.white]
                                              )
                                        ),
                                        child:  Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                            borderRadius: BorderRadius.all(Radius.circular(50)),                                        
                                                            child: Image.asset(
                                                              "assets/uploads_blue.png",
                                                              height: 110,
                                                              )
                                                      ),
                                                      Text(' You have not upload any file yet', )
                                                                      
                                            ],
                                          ) 
                                ),
                              ):
                           Wrap(
                             children: [
                              //  Row(
                              //    children: [
                              //      GestureDetector(
                              //        onTap: ()  {
                              //          if(where=='course') setState(() {
                              //            where='files';
                              //          });
                              //          print(where);
                              //         },
                              //        child: SwithButton('Files')
                              //        ),
                              //     GestureDetector(
                              //        onTap: ()=>  setState(() { 
                              //         if(where=='files') setState(() {
                              //            where='course';
                              //          });
                              //          print(where);
                              //        }),
                              //        child: SwithButton('Courses')
                              //        ),
                              //    ],
                              //  ),
                               ListView.builder(
                                         itemCount: snapshot.data!.size,
                                         shrinkWrap: true,
                                         padding: EdgeInsets.only(top: snapshot.data!.size>3 ? 40 :30,bottom: 10),
                                         physics: BouncingScrollPhysics(),
                                         itemBuilder: (context, index){
                                            DocumentSnapshot  document=snapshot.data!.docs[index];
                                         dynamic uploadsData=document.data();
                                           return Padding(
                                        padding: const EdgeInsets.only(top: 10.0,left: 30, right: 30),
                                        child: 
                                    GestureDetector(
                                      onTap: (){
                                        MyNavigate.navigatejustpush(
                                          UploadDetail(title: uploadsData['courseTitle'], 
                                          docid: document.id,
                                          useruid:uploadsData['usersid'] ,
                                          ), context);
                                      },
                                      child: Container(
                                                height: 90,
                                                width: size.width* 0.85,                  
                                                 decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black.withOpacity(0.2),
                                                        blurRadius: 30,
                                                        spreadRadius: 0,
                                                        offset: Offset(10,30)
                                                      )
                                                         ]
                                                        ),  
                                                          child: Row(                                                            
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  MyListContainer(
                                                                    title:  uploadsData['courseTitle'],
                                                                    sub_title: uploadsData['description'],
                                                                    ),
                                                                     Padding(
                                                                       padding: const EdgeInsets.only(left:17.0),
                                                                       child: Text(
                                                                 uploadsData['price']=='0'?
                                                                   'free' :uploadsData['price']+' NGN',
                                                                   style: TextStyle(
                                                                       color: Colors.amber,fontSize: 10,
                                                                   ),
                                                                  ),
                                                                     )
                                                                ],
                                                              ),
                                                                Padding(
                                                            padding: const EdgeInsets.only(right: 10.0, top:0),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                  Text(
                                                                 uploadsData['courseType']=='course'?
                                                                   '*course' :'*file',
                                                                   style: TextStyle(
                                                                     color: Colors.grey
                                                                   ),
                                                                  )
                                                                  //  Flexible(
                                                                  //    child: IconButton(                                                                   
                                                                  //     icon : Icon(Icons.delete),
                                                                  //     color: Colors.red, 
                                                                  //     onPressed: () async { 
                                                                  //       return 
                                                                  //       FirebaseFirestore.instance
                                                                  //       .collection('notes')
                                                                  //       .doc(user.uid)
                                                                  //       .collection('user_notes')
                                                                  //       .doc(document.id)
                                                                  //       .delete();
                                                                  //      },                                                            
                                                                  //                                                                ),
                                                                  //  ),
                                                              ],
                                                            ),
                                                          )
                                                            ],
                                                          )
                                                      ),
                                    ),                      
                                      );
                                         }
                                         ),
                              Container(
                                height: 50,
                              )
                             ],
                           ),
                        ),
                      ),
                    ],
                  ),
                   Positioned(
                    
                child: Padding(              
                  padding: EdgeInsets.only(
                    top:size.height*0.8),
                  child: Center(           
                  child: MyGradientButton(
                    placeHolder: 'Upload', 
                    pressed: (){
                        // popUp(context);
                        MyNavigate.navigatejustpush(UploadFiles(), context);
                    }, 
                    firstcolor: homepageBlue,
                     secondcolor: homepageLightBlue,
                     child:Padding(
                                                 padding: const EdgeInsets.only(left:18.0),
                                                 child: ImageIcon(
                                                  AssetImage('assets/uploads_blue.png'),
                                                    size: 30,
                                                    color: Colors.white,
                                                  ),
                                               ),
                     )
              ),
                )
                 )
                  ]
              ),
            ),
          
          );
        }else{
          return Loading();
        }
      }
    );

  }
   Widget SwithButton(name)=> Padding(
                    padding: const EdgeInsets.only( left:34.0, top:40 ),
                    child: Row(                      
                       mainAxisAlignment:  MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(                        
                        gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [ homepageBlue,homepageLightBlue]
                                         ),                                      
                        borderRadius: BorderRadius.all(Radius.circular(100)), 
                         boxShadow: [
                                                          BoxShadow(
                                                            color: welcomepageBlue.withOpacity(0.24),
                                                            // spreadRadius: 5,
                                                            blurRadius: 10,
                                                            offset: Offset(0, 5), // changes position of shadow
                                                          ),
                                                        ],
                     ),
                     child: Center(
                         child: Text(
                           name,
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 15
                           ),
                         )
                     ),
                  
               ),
     ],
   ),
 );
}