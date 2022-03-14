import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/components/myoval_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/pages/uploads.dart';
import 'package:brainworld/pages/uploads/upload_files.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'course/upload_course_info.dart';

Future popUp(context){
    
    int count=0;
    return showDialog(
      context: context,
      builder:(context)=>AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        content: Container(
          height: 214,          
          child: Center(
            child: Column(
              children: [
                                Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: ImageIcon(
                                        AssetImage('assets/uploads_blue.png'),
                                          size: 58,
                                          color: Colors.white,
                                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:17.0,top: 9),
                      child: Text(
                  'What did u want to upload?',                  
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    MyOvalGradientButton(placeHolder: 'A Course',
                                       firstcolor: homepageBlue, secondcolor: homepageLightBlue
                                       , pressed: (){
                                         MyNavigate.navigateandreplace(UploadCourseInfo(), context);
                                       }),
                                SizedBox(height: 14),
                    MyOvalGradientButton(placeHolder: 'A File', 
                          firstcolor: homepageBlue, secondcolor: homepageLightBlue,
                          pressed: (){
                            MyNavigate.navigateandreplace(UploadFiles(), context);
                          },
                          ),
                         ],
            ),
          ),
        ),
      ),
    );
  }

 
  