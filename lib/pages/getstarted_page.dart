

import 'package:brainworld/authentications/register.dart';
import 'package:brainworld/authentications/user/dashboard.dart';
import 'package:brainworld/components/gradient_text.dart';
import 'package:brainworld/components/my_button.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:flutter/material.dart';


class GetStartedPage extends StatefulWidget {
  GetStartedPage({Key? key, }) : super(key: key);


  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {

  @override
  Widget build(BuildContext context){
    Size size= MediaQuery.of(context).size;
          return Scaffold(
  body: SafeArea(
      child: SingleChildScrollView(
    child: Stack(
     
      children:[ 
      //    Positioned(
      //   top: -321,
      //   right: -139,
      //   child: Image.asset(
      //     'assets/mycurve.png',
      //     width:size.height * 0.805,
      //     height:1000,
      //     ),
      // ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
          
          Padding(
            padding: const EdgeInsets.only(top:139.0),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                    padding: EdgeInsets.all(0.0),
                    height: 100,
                     child:
                      Image.asset('assets/picture.png')
                ),
                GradientText(
                  'GET STARTED',
                  style: const TextStyle(
                    fontSize: 35
                    ),
                  gradient: LinearGradient(
                     begin: Alignment.centerRight,
                    end: Alignment.bottomRight,
                    colors: [
                    const Color(0xff00dcff),
                    const Color(0xff0837ff),                    
                  ]),
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
                  placeHolder: 'Continue as guest',
                  pressed: (){
                    MyNavigate.navigatejustpush(Dashboard(), context);
                  },
                ),
                MyGradientButton(
                  placeHolder: 'Sign up',
                  firstcolor:const Color(0xff019bf9) ,
                  secondcolor:const Color(0xff0b6dff),
                  pressed: (){
                    MyNavigate.navigatejustpush(Register(), context);
                  },
                  ),

                ],
              ),
            ),
          )
        ],
      ),
      ]
    ),
  )),
);
  }
}