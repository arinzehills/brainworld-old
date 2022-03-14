import 'package:brainworld/pages/chats/components/chat_list_widget.dart';
import 'package:brainworld/components/custom_sliver_delegate.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/services/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'models/message.dart';

class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  //  List<UsersMessage> userMessage = [
  //   UsersMessage(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "assets/uploads_blue.png", created_time: "Now", sendersid: '',receiversid: ''),
  //   UsersMessage(name: "Glady's Murphy", messageText: "That's Great", imageURL: "assets/user_blue.png", created_time: "Yesterday", sendersid: '',receiversid: ''),
  //   UsersMessage(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "assets/uploads_blue.png", created_time: "31 Mar", sendersid: '',receiversid: ''),
  //   UsersMessage(name: "Philip Fox", messageText: "Busy! Call me in 20 mins ", imageURL: "assets/uploads_blue.png", created_time: "28 Mar", sendersid: '',receiversid: ''),
  //   UsersMessage(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "assets/uploads_blue.png", created_time: "23 Mar", sendersid: '',receiversid: ''),
  //   UsersMessage(name: "Jacob Pena", messageText: "will update you in evening", imageURL: "assets/uploads_blue.png", created_time: "17 Mar", sendersid: '',receiversid: ''),
  //   UsersMessage(name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "assets/uploads_blue.png", created_time: "24 Feb", sendersid: '',receiversid: ''),
  //   UsersMessage(name: "John Wick", messageText: "How are you?", imageURL: "assets/uploads_blue.png", created_time: "18 Feb", sendersid: '',receiversid: ''),
  // ];
  Widget builMessageListWidget()=>StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
            .collection('users')
            .snapshots(),
          builder: (context, snapshots){
            final messages =snapshots.data;
            Size size= MediaQuery.of(context).size;
            // print(snapshots);
            // print(snapshots);
            if(snapshots.hasData){
             
              return 
               snapshots.data!.size==0  ?
                Center(
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
                                                          "assets/chat_blue.png",
                                                          height: 110,
                                                          )
                                                  ),
                                                  Text(' no chats yet', )
                                                                  
                                        ],
                                      ) 
                            ),
                      )
              :
                ListView.separated(
                              itemCount:  snapshots.data!.size,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 16),
                              physics:BouncingScrollPhysics(),
                              itemBuilder: (context, index){
                                DocumentSnapshot  document=snapshots.data!.docs[index];
                                  dynamic users=document.data();
                                return ChatListWidget(
                                  userid: users['uid'],
                                  name: users['user_name']??'',
                                  messageText: users['messageText'] ??'',
                                  imageUrl: users['imageUrl'],
                                  time: users['uid'],
                                  isMessageRead: (index == 0 || index == 3)?true:false,
                                );
                              },
                               separatorBuilder: (BuildContext context, int index) => 
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left:25.0,
                                     right: 2),
                                  child: Container(
                                   height: 2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [ homepageLightBlue,homepageBlue]
                                      )
                                      ),
                                   
                                   ),
                                ),
                            );
            }else{
              return Container();
         }
             },
  );

  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
      int empty=0;
    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                shrinkWrap: true,       
                slivers: <Widget>[
                  SliverPersistentHeader(
                     pinned: true,                      
                      floating: true,
                    delegate: CustomSliverDelegate(
                        expandedHeight: 109,                        
                        title: 'Chat',
                        searchHint: 'Chats',
                        alignment: Alignment(0.0, 0.9),
                        curveContainerHeight: size.height * 0.3,
                        widget2: SizedBox(),
                        showaligncontainerwidget: false,
                      ),
                  ),
                  SliverFillRemaining(
                      child:builMessageListWidget()
                      // ): ListView.separated(
                      //         itemCount: userMessage.length,
                      //         shrinkWrap: true,
                      //         padding: EdgeInsets.only(top: 16),
                      //         physics:ScrollPhysics(),
                      //         itemBuilder: (context, index){
                      //           return ChatListWidget(
                      //             userid: 'userid',
                      //             name: userMessage[index].name,
                      //             messageText: userMessage[index].messageText,
                      //             imageUrl: userMessage[index].imageURL,
                      //             time: userMessage[index].created_time,
                      //             isMessageRead: (index == 0 || index == 3)?true:false,
                      //           );
                      //         },
                      //          separatorBuilder: (BuildContext context, int index) => 
                      //           Padding(
                      //             padding: const EdgeInsets.only(
                      //               left:25.0,
                      //                right: 2),
                      //             child: Container(
                      //              height: 2,
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                      //                 gradient: LinearGradient(
                      //                   begin: Alignment.topLeft,
                      //                   end: Alignment.bottomRight,
                      //                   colors: [ homepageLightBlue,homepageBlue]
                      //                 )
                      //                 ),
                                   
                      //              ),
                      //           ),
                      //       ),
                    ),
                        
                  
                ]
              )
            //   Builder(
            //   builder:(context)=> Column(
            //     children: [
            //       MyCurveContainer(
            //         size: size,
            //         height: size.height * 0.24,
            //         pagetitle: 'chats',
            //         searchHint: 'here...',
                    
            //         ),
                    // ListView.separated(
                    //       itemCount: UsersMessage.length,
                    //       shrinkWrap: true,
                    //       padding: EdgeInsets.only(top: 16),
                    //       physics: NeverScrollableScrollPhysics(),
                    //       itemBuilder: (context, index){
                    //         return ChatList(
                    //           name: UsersMessage[index].name,
                    //           messageText: UsersMessage[index].messageText,
                    //           imageUrl: UsersMessage[index].imageURL,
                    //           time: UsersMessage[index].time,
                    //           isMessageRead: (index == 0 || index == 3)?true:false,
                    //         );
                    //       },
                    //        separatorBuilder: (BuildContext context, int index) => 
                    //         Padding(
                    //           padding: const EdgeInsets.only(
                    //             left:25.0,
                    //              right: 2),
                    //           child: Container(
                    //            height: 2,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                    //               gradient: LinearGradient(
                    //                 begin: Alignment.topLeft,
                    //                 end: Alignment.bottomRight,
                    //                 colors: [ homepageLightBlue,homepageBlue]
                    //               )
                    //               ),
               
                    //            ),
                    //         ),
                    //     ),
                  //  Chatlist(),
                  
             
            ]
          ),
        
      ),
 
    );
  }
   Widget buildNoChats(String text,Size size)=>Center(

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
                                                          "assets/chat_blue.png",
                                                          height: 110,
                                                          )
                                                  ),
                                                  Text(' no chats yet', )
                                                                  
                                        ],
                                      ) 
                            ),
                      );
}

