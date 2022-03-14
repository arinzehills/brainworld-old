import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:flutter/material.dart';

import '../chat_detail.dart';



class ChatListWidget extends StatefulWidget{
  String userid;
  String name;
  String? messageText;
  String? imageUrl;
  String? time;
  bool? isMessageRead;
  ChatListWidget({
    required this.userid,
    required this.name,@required this.messageText,@required this.imageUrl,@required this.time,@required this.isMessageRead});
  @override
  _ChatListWidgetState createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  @override
  Widget build(BuildContext context) {
  
    return GestureDetector(
     onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatDetail(clickeduserid: widget.userid,
                    name: widget.name,
          );
        }));
     },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(widget.imageUrl!) ,
                  //   maxRadius: 30,
                  // ),
                    ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              
                              child: Image.asset(
                                "assets/user_blue.png",
                                height: 50,)
                                            ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.name, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(widget.messageText!,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, 
                          // fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal
                          ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.time!,style: TextStyle(fontSize: 12,
            // fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal
            ),),
          ],
        ),
      ),
    );
  }
}