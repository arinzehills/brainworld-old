import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/pages/chats/models/chat_message.dart';
import 'package:brainworld/services/chats_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';     

import 'models/message.dart';

class ChatDetail extends StatefulWidget {
  final String clickeduserid;//this is  identifies the user that u click to view his chat
  final String name;//this is  identifies name of the user that u click to view his chat
  const ChatDetail({ Key? key,
   required this.clickeduserid,
    required this.name, }) : super(key: key);

  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
List<QuerySnapshot> combineLists(
      List list1, List<QuerySnapshot> list2) {
    List<QuerySnapshot> result = [];
    list1.forEach((element) {
      result.add(element);
    });
    list2.forEach((element) {
      result.add(element);
    });
    return result;
  }
  // Stream<QuerySnapshot>? combineStream(userid){
  //      Stream chat1=FirebaseFirestore.instance
  //           .collection('chats')
  //           .doc(userid)
  //           .collection('messages')
  //           .where('idUser', isEqualTo: widget.clickeduserid)
  //           .snapshots();

  //            Stream chat2=FirebaseFirestore.instance
  //           .collection('chats')
  //           .doc(widget.clickeduserid)
  //           .collection('messages')
  //           .where('idUser', isEqualTo: userid)
  //           .snapshots();

  //           return
  //           // Rx.combineLatest2(chat1, chat2, (a, b) => [a,b]);
  //           // chat1.mergeWith([chat2]);
  // }
  
  Widget buildText(text)=>Center(
    child: Text(
      text,

    ),
  );
   Widget builMessageWidget(userid){ 
     Stream chat1=FirebaseFirestore.instance
            .collection('chats')
            .doc(userid)
            .collection('messages')
            .where('idUser', isEqualTo: widget.clickeduserid)
            .snapshots();

             Stream chat2=FirebaseFirestore.instance
            .collection('chats')
            .doc(widget.clickeduserid)
            .collection('messages')
            .where('idUser', isEqualTo: userid)
            .snapshots();
       Stream combineStream=
       Rx.combineLatest2(chat1, chat2, (a, b) => [a,b]);
      //  StreamZip([stream1, stream2]).asBroadcastStream();
       
   
        // Stream<QuerySnapshot> combineStream= chat1.mergeWith([chat2])
        // as Stream<QuerySnapshot>;
 
     return StreamBuilder(
          stream:combineStream,
          builder: (context, snapshot){
            print(widget.clickeduserid);
            // final messages =snapshots.data;
            final List<QuerySnapshot> _list=[];
        //  final List<QuerySnapshot> combineSnapshot =
        //             combineLists(snapshot.data![0], snapshot.data![1]);
            print(snapshot.data);
            // final data0 = snapshot.data![''];
            // final data1 = snapshot.data![1];
            if(snapshot.hasData){
          print(widget.clickeduserid);
              return
              //  messages!.isEmpty ?
               _list.length==0 ?
               buildText('Say Hi')
              :
                ListView.builder(
            itemCount: _list.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index){
                //  DocumentSnapshot  document=snapshots.data!.docs[index];
                //  dynamic messages=document.data();
                // _list[index].docs[index];
              return
                          Container(
                  padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                  child: Align(
                    alignment: (
                      // messages['idUser'] ==widget.clickeduserid 
                      // ?Alignment.topLeft:
                      Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (
                          // messages['idUser'] ==widget.clickeduserid 
                        //  ? Colors.grey.shade200:
                         Colors.blue[200]),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        // messages['messageText'] ??
                        '', 
                      style: TextStyle(fontSize: 15),),
                    ),
                  ),
                );
            },
          );
            }else{
              return Container(
                child: CircularPercentIndicator(radius: 50,),
              );
         }
             },
  );
  }
    final _controller =TextEditingController();
    String message='';
  @override
  Widget build(BuildContext context) {
    var sendersid=currentuser(context).uid;
    print(widget.clickeduserid);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.blue,),
                ),
                SizedBox(width: 2,),
                // CircleAvatar(
                //   backgroundImage: NetworkImage("<https://randomuser.me/api/portraits/men/5.jpg>"),
                //   maxRadius: 20,
                // ),
                 ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(50)),                              
                              child: Image.asset(
                                          "assets/user_blue.png",
                                          height: 50,
                                          )
                                            ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.name,style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
                // Icon(Icons.settings,color: Colors.black54,),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          builMessageWidget(sendersid,),
          //  ListView.builder(
          //   itemCount: messages.length,
          //   shrinkWrap: true,
          //   padding: EdgeInsets.only(top: 10,bottom: 10),
          //   physics: NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index){
          //     return
          //                 Container(
          //         padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
          //         child: Align(
          //           alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
          //           child: Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
          //             ),
          //             padding: EdgeInsets.all(16),
          //             child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
          //           ),
          //         ),
          //       );
          //   },
          // ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textCapitalization: TextCapitalization.sentences,
                      autocorrect: true,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                      onChanged: (value)=>setState((){
                        message=value;
                      }),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                      message.trim().isEmpty ?
                      null: 
                      sendMessage(sendersid,widget.clickeduserid,message);
                    },
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
                
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> sendMessage(sendersid,recieversid,message) async {
    FocusScope.of(context).unfocus();
  print(message);
    await  ChatService(uid: sendersid).
    sendMessage(recieversid,
    'Arinze', message, 'imageURL');

    _controller.clear();
  }
}