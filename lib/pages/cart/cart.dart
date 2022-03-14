import 'package:brainworld/components/gradient_text.dart';
import 'package:brainworld/components/myoval_gradient_button.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/pages/checkout/checkout.dart';

import '../../home_page.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyCartWidget extends StatelessWidget {
  const MyCartWidget({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  final List<String> imgUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(            
      children: [   
        imgUrl.isNotEmpty ?   Padding(
          padding: const EdgeInsets.only(top:35.0, bottom: 80),
          child: ListView.builder(
                                  itemCount: 9,
                                      shrinkWrap: true,
                                      //  padding: EdgeInsets.only(top: 10,bottom: 10),
                                      physics: ScrollPhysics(),
                                      itemBuilder: (context, index){
                                        return
                                        Padding(
                                      padding: const EdgeInsets.only(top: 15.0,left: 10, right: 10, bottom: 10),
                                      child: Container(
                                                  width: double.infinity,                  
                                                    decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 30,
                                    spreadRadius: 0,
                                    offset: Offset(5,20)
                                  )
                                ]
                                                    ),  
                        child: Column(
                          children: [
                            Row(//the whole row of the container
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(//the row that container the image and the name
                                        children: [
                                            ClipRRect(
                                                                  borderRadius: BorderRadius.all(Radius.circular(50)),                                        
                                                                  child: Image.asset(
                                                                    "assets/sciences.png",
                                                                    height: 70,
                                                                    )
                                                              ),
                                          Column(
                                            children: [
                                                 Text('Sciences',style: TextStyle(fontWeight: FontWeight.bold),),
                                           Row(//for name of author
                                          children: [
                                              Icon(
                                                  Icons.person,
                                                  color:Colors.grey ,
                                                  size: 15,
                                                  ),
                                              Text('admin',style: TextStyle(fontSize: 15, color: Colors.grey),),
                                          ]                                            
                                        ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]
                                    
                                    ),
                                      SizedBox(height: 0,),
                                  Padding(
                                    padding: const EdgeInsets.only(left:12.0),
                                    child: Row(
                                      children: [                                            
                                                        Icon(
                                            Icons.delete,
                                            color:Colors.red ,
                                            ),
                                        Text('Remove',style: TextStyle(fontWeight: FontWeight.bold),),
                                        SizedBox(width: 15,),
                                        Text('NGN 20',style: TextStyle(fontWeight: FontWeight.bold),), 
                                      ],
                                    ),
                                  )
                          ],
                        ),
                                          )
                                  );
                                      }
                              ),
        ):
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Padding(
                    padding: const EdgeInsets.only(left:13.0),
                    child:GradientText('Your cart', 
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    gradient: LinearGradient(
                      colors:  [homepageBlue,welcomepageLightBlue],
                      
                    ))
                  ),
                  RadiantGradientMask(
                    child: IconButton(
                              icon: Icon(
                                //  Icons.cabin,
                                Icons.cancel_outlined,
                                color:Colors.blue ,
                                ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                  ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.only(top:8.0, bottom: 14),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('No Items in cart', 
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
                    )                      ,
                RadiantGradientMask(
                          child: IconButton(
                                    icon: Icon(
                                      //  Icons.cabin,
                                      Icons.cabin,
                                      color:Colors.blue ,
                                      size: 80,
                                      ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                        ),
                        SizedBox(height: 40,)                
              ],
            ),
          ),
          ]
        ),
        if(imgUrl.isNotEmpty) Align(
          alignment: Alignment.topCenter,
          child:  Container(
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Padding(
                      padding: const EdgeInsets.only(left:13.0),
                      child:GradientText('Your cart', 
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      gradient: LinearGradient(
                        colors:  [homepageBlue,welcomepageLightBlue],
                        
                      ))
                    ),
                    RadiantGradientMask(
                      child: IconButton(
                                icon: Icon(
                                  //  Icons.cabin,
                                  Icons.cancel_outlined,
                                  color:Colors.blue ,
                                  ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                    ),
                ],
              ),
          ),
            ),
         Align(
          alignment: Alignment.bottomCenter,
          child:     Container(
                              constraints: BoxConstraints(
                                  maxHeight: double.infinity,
                              ),
                              height: 75,
                              width: double.infinity,                  
                                decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 30,
                                  spreadRadius: 0,
                                  offset: Offset(5,20)
                                ),
                              ],
                               gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [ homepageLightBlue,homepageBlue]
                                      )
                                                  ),  
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0, left: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                         Text(
                                            'Total',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                              Text(
                                            'NGN 500',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 26,
                                            ),
                                        ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top:12.0, left: 6),
                                  child: MyOvalGradientButton(
                          placeHolder: 'Checkout', 
                          pressed: (){ 
                            MyNavigate.navigatejustpush(Checkout(), context);
                          }, 
                          firstcolor: homepageLightBlue, secondcolor: homepageBlue,),
                                ),
                              ],
                            ),
                          )
        
        ),            
          ],
        );
  }
}
