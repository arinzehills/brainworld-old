

import 'package:brainworld/authentications/login.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/pages/getstarted_page.dart';
import 'package:flutter/material.dart';
import 'components/my_button.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, }) : super(key: key);


  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  
  @override
  Widget build(BuildContext context){
    // const String testDevice = 'Kris';
          return Scaffold(
  body: SafeArea(
      child: SingleChildScrollView(
    child: Container(
      decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [ welcomepageLightBlue,welcomepageBlue]
                )
                 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
          Padding(
            padding: const EdgeInsets.only(top:78.0),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                    padding: EdgeInsets.all(0.0),
                    height: 100,
                     child:
                      Image.asset('assets/picture.png')
                ),
                Text(
                  'BRAIN WORLD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35
                  ),
                ),
                  Text(
                  '...a perfect  place to learn',
                  style: TextStyle(
                    color: const Color(0xffffb00b),
                    fontSize: 15
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
                     height: MediaQuery.of(context).size.height * 0.1,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,  
                  colors: [ welcomepageLightBlue,welcomepageBlue]

                )
                 ),
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(top:125.0),
              child: Column(
                children: [
                  MyButton(
                  placeHolder: 'Login',
                  pressed: (){
                    MyNavigate.navigatejustpush(Login(), context);

                  },
                ),
                MyGradientButton(
                  placeHolder: 'Get started',
                  firstcolor:const Color(0xff019bf9) ,
                  secondcolor:const Color(0xff0b6dff) ,
                  pressed: (){
                     Navigator.push(context,
  
                    MaterialPageRoute(builder: (context) => GetStartedPage()));
                  },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  )),
);
  }
}