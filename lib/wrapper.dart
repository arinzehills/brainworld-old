import 'dart:async';
import 'dart:io';

import 'package:brainworld/authentications/user/dashboard.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/loading.dart';
import 'package:brainworld/librarytest.dart';
import 'package:brainworld/pages/chats/chat.dart';
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:brainworld/pages/library.dart';
import 'package:brainworld/welcome_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'authentications/admin/admin_dashboard.dart';
import 'models/myuser.dart';
class Wrapper extends StatefulWidget {
  
  
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late ConnectivityResult previous;
  late StreamSubscription _streamSubscription;
  bool showdialog=false;

  //   Future<bool> checkInternet() async {
  //       try{
  //         final result =await InternetAddress.lookup('google.com');
      
  //       if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
  //         //connection is available
  //         // // Navigator.of(context).pop(false);
  //         // setState(() {
  //         //   showdialog=false;
  //         // });
  //         return Future.value(true);
  //       }
       
  //   } on SocketException catch(_){
  //     // no internet
  //     // _showDialog();
  //          return 
  //         Future.value(false);
  //        }
  //   }
  // @override
  // void initState(){
  //   super.initState();
  

  //   Connectivity().onConnectivityChanged.
  //                   listen((ConnectivityResult connresult) {
  //          if(connresult == ConnectivityResult.none){
  //                       // no internet
  //                       showdialog=true;
  //                        showDialog(
  //                           context: context,
  //                         barrierDismissible: false, // user must tap button!
  //                          builder:(context)=>AlertDialog(
  //                             title:Text('No internet Connection available'),
  //                             actions: <Widget>[
  //                                     RaisedButton(
  //                                 child: Text('Exit'),
  //                                 color: Color(MyApp().myred),
  //                                 shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(30)),
  //                                 onPressed:()=>SystemChannels.
  //                                           platform.invokeMethod('SystemNavigator.pop'),
  //                               ),
  //                             ]
  //                           ),
                         
  //                        );
  //         }else if (previous ==ConnectivityResult.none){
  //           checkInternet().then((result){
  //             if(result ==true){
  //               //there is internet connection
  //               if(showdialog==true){
  //                 showdialog= false;
  //                 Navigator.pop(context);
  //               }
  //             }
  //           });
  //         }
               
  //              previous = connresult;
  //            });

                       
  // }

  void _showDialog(){
    // setState(() {
    //   showdialog=true;
    // });
    // showdialog=true;
    // if(coo){
    //   showDialog(
    //   context: context,
    //   builder:(context)=>AlertDialog(
    //     title:Text('No internet Connection available'),
    //     actions: <Widget>[
    //              RaisedButton(
    //         child: Text('Exit'),
    //         color: Color(MyApp().myred),
    //          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    //         onPressed:()=>SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
    //       ),
    //     ]
    //   ),
    // );
    // }
    // else if (previous ==ConnectivityResult.none){
    //   checkInternet().then((value){
    //     if(result ==true){
    //        if(showdialog==true){
    //          showdialog= false;
    //          Navigator.pop(context);
    //        }
    //     }
    //   })
    // }
  }
  // void checkConnectivity(){
  //    Connectivity().onConnectivityChanged.
  //                   listen((ConnectivityResult connresult) {
  //          if(connresult == ConnectivityResult.none){
  //                       // no internet
  //                       showdialog=true;
  //                        showDialog(
  //                           context: context,
  //                         barrierDismissible: false, // user must tap button!
  //                          builder:(context)=>AlertDialog(
  //                             title:Text('No internet Connection available'),
  //                             actions: <Widget>[
  //                                     RaisedButton(
  //                                 child: Text('Exit'),
  //                                 color: homepageBlue,
  //                                 shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(30)),
  //                                 onPressed:()=>SystemChannels.
  //                                           platform.invokeMethod('SystemNavigator.pop'),
  //                               ),
  //                             ]
  //                           ),
                         
  //                        );
  //         }else if (previous ==ConnectivityResult.none){
  //           checkInternet().then((result){
  //             if(result ==true){
  //               //there is internet connection
  //               if(showdialog==true){
  //                 showdialog= false;
  //                 Navigator.pop(context);
  //               }
  //             }
  //           });
  //         }
               
  //              previous = connresult;
  //            });

                       
  // }
  
  @override
  void dispose(){
    super.dispose();
    _streamSubscription.cancel();
  }
  @override
  Widget build(BuildContext context) {
     final user= Provider.of<MyUser>(context);
    
     if(user==null){
       return WelcomePage();
     } 
     else{
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData && snapshot.data != null){
              // UserHelper.saveUser(snapshot.data);
              // print(snapshot.connectionState);
              // print(snapshot.data);

              return StreamBuilder(
                stream: FirebaseFirestore.instance.collection('users')
                .doc(snapshot.data!.uid).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot>
                  snapshots){
                     if(snapshot.hasData && snapshot.data != null){
                       if(snapshot.data==null){
                         return Loading();
                       }
                       final dynamic snapshotdata = snapshots.data;
                       final user=snapshotdata.data();
                      //  print(user['role']);
                       if(user['role']=='normal'){
                         return HomePageNavagation();
                       }
                       else{
                         return Lib();
                       }
                     }
                     else{
                       return  Loading(); 
                     }
                     
                      },
                  
              );
            } else{
              return Loading();
            }
            
          }
        );
     
      //  return StreamBuilder<Object>(
      //    stream: DataBaseService(uid: user.uid).userData,
      //    builder: (context, snapshot) {
      //      if(snapshot.hasData){
      //     UsersDetail userData= snapshot.data;
      //       if(userData.isDriver==true){
              
      //         return Authenticated();
      //       }
      //       else{
      //         return BottomNav();
      //      }
      //      }
      //    }
      //  );
     }
  }
}

