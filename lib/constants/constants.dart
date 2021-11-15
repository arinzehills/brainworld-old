import 'package:flutter/material.dart';

const  appId="0282cdbc-0b53-4f12-b9c9-4762e3ebedc2";
final iconsColor=const Color(0xffffffff);
final welcomepageBlue= const Color(0xff0837ff);
final welcomepageLightBlue= const Color(0xff00dcff);
final homepageBlue= const Color(0xff0b6dff);
final homepageLightBlue= const Color(0xff019bf9);
final myOrangeGradient= [const Color(0xffdb6c17),const Color(0xffff00b)];
 Size size(context)=> MediaQuery.of(context).size;
var textFieldDecoration = InputDecoration(
                              
                                  
                                   hintStyle: TextStyle(
                                     color:const  Color(0xff626262)),
                                  filled: true,
                                  fillColor:const  Color(0xfff7f7f7),
                                  focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.0),
                                 ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.0),
                                    ), 
);