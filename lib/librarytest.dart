import 'dart:ffi';

import 'package:brainworld/components/normal_curve_container.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Lib extends StatefulWidget {
  const Lib({ Key? key }) : super(key: key);

  @override
  _LibState createState() => _LibState();
}

class _LibState extends State<Lib> {
  @override
  Widget build(BuildContext context) {
         Size size= MediaQuery.of(context).size;

    return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                ChatHeaderWidget(),
                // BodyWidget
              ],
            ),
          ),
      
    );
  }
}

class ChatHeaderWidget extends StatelessWidget {
  // final List<User> users;

  // const ChatHeaderWidget({
  //   // @required this.users,
  //   // Key key,
  // }) ;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Text(
                'ChatsApp',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                itemBuilder: (context, index) {
                  // final user = 2;
                  if (index == 0) {
                    return Container(
                      margin: EdgeInsets.only(right: 12),
                      child: CircleAvatar(
                        radius: 24,
                        child: Icon(Icons.search),
                      ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => ChatPage(user: users[index]),
                          // ));
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage:AssetImage( 'assets/menu_white.png'),
                        ),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      );
}

class ChatBodyWidget extends StatelessWidget {
  // final List<User> users;

  // const ChatBodyWidget({
  //   // @required this.users,
  //   // Key key,
  // })

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: buildChats(),
        ),
      );

  Widget buildChats() => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          // final user = users[index];

          return Container(
            height: 75,
            child: ListTile(
              onTap: () {
               
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage( 'assets/menu_white.png'),
              ),
              title: Text('user.name'),
            ),
          );
        },
        itemCount: 4,
      );
}