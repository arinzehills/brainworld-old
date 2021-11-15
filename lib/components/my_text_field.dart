import 'package:brainworld/constants/constants.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  String hintText;
  String? value;
  bool? obscureText;
  // final VoidCallback pressed;
  IconButton? suffixIconButton;
  Icon? prefixIcon;

  // IconButton(
  //                                             icon: const Icon(Icons.visibility),
  //                                             color:iconsColor,
  //                                             onPressed: () {
  //                                              if(obscureText==true){
  //                                                 setState(() {
  //                                                   obscureText=false;
  //                                                 });
  //                                               }
  //                                               else{
  //                                                 setState(() {
  //                                             obscureText=true;   
  //                                               });
  //                                               }
  //                                             },
  //                                         ),

  MyTextField({
    required this.hintText, 
    // required this.pressed,
    this.suffixIconButton,
    this.value,
    this.obscureText,
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
                                // validator: (val)=> val.length < 6 ? 'Enter a valid password' : null,
                                        obscureText: widget.obscureText ?? false,
                                      decoration:textFieldDecoration.copyWith(
                                          prefixIcon: widget.prefixIcon,
                                          suffixIcon: widget.suffixIconButton,
                                           
                                        // suffixIcon: ,
                                          hintText:widget.hintText,
                                      ) ,
                                        onChanged: (val){
                                            setState(() =>widget.value=val);
                                        },
                              ) ;
  }
}