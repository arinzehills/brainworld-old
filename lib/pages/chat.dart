import 'package:brainworld/components/chat_list.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/my_curve_container.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:flutter/material.dart';
class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

   List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "assets/uploads_blue.png", time: "Now"),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: "assets/user_blue.png", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "assets/uploads_blue.png", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins ", imageURL: "assets/uploads_blue.png", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "assets/uploads_blue.png", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", imageURL: "assets/uploads_blue.png", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "assets/uploads_blue.png", time: "24 Feb"),
    ChatUsers(name: "John Wick", messageText: "How are you?", imageURL: "assets/uploads_blue.png", time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;

    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              
              Builder(
              builder:(context)=> Column(
                children: [
                  MyCurveContainer(
                    size: size,
                    height: size.height * 0.24,
                    pagetitle: 'chats',
                    searchHint: 'here...',
                    
                    ),
                    ListView.separated(
                          itemCount: chatUsers.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 16),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index){
                            return ChatList(
                              name: chatUsers[index].name,
                              messageText: chatUsers[index].messageText,
                              imageUrl: chatUsers[index].imageURL,
                              time: chatUsers[index].time,
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
                        ),
                  //  Chatlist(),
                  Padding(
                        padding: const EdgeInsets.only(top: 60.0,left: 30),
                        child: 
                    Container(
                height: 100,
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
                          child: Center(
                            child: Text(
                              'Join a lecture'
                            ),
                          ),  
                        ),                      
                      ),

                ],
              ),
            ),
            ]
          ),
        ),
      ),
 
    );
  }
}


class ChatUsers{
  String? name;
  String? messageText;
  String? imageURL;
  String? time;
  ChatUsers({@required this.name,@required this.messageText,@required this.imageURL,@required this.time});
}