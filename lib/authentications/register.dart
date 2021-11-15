

import 'package:brainworld/authentications/login.dart';
import 'package:brainworld/components/gradient_text.dart';
import 'package:brainworld/components/my_button.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/components/my_text_field.dart';
import 'package:brainworld/components/no_account.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key? key, }) : super(key: key);


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
    bool obscureText=false;
  @override
  Widget build(BuildContext context){
    Size size= MediaQuery.of(context).size;
          return Scaffold(
  body: SafeArea(
      child: SingleChildScrollView(
    child: Stack(
     
      children:[ 
         Positioned(
        top: -130,
        right: -159,
        child: Image.asset(
          'assets/mycurve.png',
          width:size.height * 0.805,
          height:450,
          ),
      ),
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
                  'REGISTER',
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
                               
                 
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 10.0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                        'Full name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                        
                              SizedBox(
                                  height:10,
                              ),
                      MyTextField(hintText: 'Enter your full name',),
                              SizedBox(
                                  height:20,
                              ),
                       Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                              SizedBox(
                                  height:10,
                              ),
                       MyTextField(
                         hintText: 'Enter your email',
                         
                         ),
                       
                              SizedBox(
                                  height:20,
                              ),
                       Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                       MyTextField(
                         hintText: 'Enter password',
                         obscureText:obscureText,
                         suffixIconButton: IconButton(
                                              icon: const Icon(Icons.visibility),
                                              color:welcomepageBlue,
                                              onPressed: () {
                                               if(obscureText==true){
                                                  setState(() {
                                                    obscureText=false;
                                                  });
                                                }
                                                else{
                                                  setState(() {
                                              obscureText=true;   
                                                });
                                                }
                                              },
                                            ),
                                          ),
                        SizedBox(
                                  height:20,
                              ),
                      MyGradientButton(
                  placeHolder: 'Register Now',                  
                  secondcolor:const Color(0xff0b6dff),
                  firstcolor:const Color(0xff0bc9ff) ,
                  pressed: (){
                    MyNavigate.navigatejustpush(Register(), context);
                  },
                  ),
                  SizedBox(height: 15,),
                   NoAccount(
            title: 'Already have an account?',
            subtitle: 'LOGIN',
            pressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                Login()), (Route<dynamic> route) => false);
            },
          )  
              ],
            ),
          ),
          
        ],
      ),
      ]
    ),
  )),
);
  }
}