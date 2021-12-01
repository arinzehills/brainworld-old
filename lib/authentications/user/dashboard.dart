import 'dart:async';
import 'package:brainworld/pages/notes/notes.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/my_curve_container.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/components/myoval_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../home_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // get welcomepageBlue => null;
  
  double percent = 0.0;


  @override
  void initState() {
    // late Timer timer;
    // timer = Timer.periodic(Duration(milliseconds:1000),(_){
    //   setState(() {
    //     percent+=10;
    //     if(percent >= 60){
    //       timer.cancel();
    //       // percent=0;
    //     }
    //   });
    // });
    super.initState();
  }

  @override
  void dispose() {
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
  double _height;
  double _width;
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
                    height: size.height * 0.5,
                    pagetitle: 'Brain world',
                    searchHint: 'here...',
                    curvecontainerwidget1: Padding(
                      padding: const EdgeInsets.only(left:33.0, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back,',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Arinzechukwu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                  Padding(
                        padding: const EdgeInsets.only(top: 150.0,left: 30),
                        child: Row(
                  children: [
                MySmallContainer(size: size,title: 'Join a lecture',),
                    SizedBox( width: 10,),
                    MySmallContainer(size: size,title: 'Notes', onClick: (){MyNavigate.navigatejustpush(Notes(), context);}),
                  ]
            ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 30),
                        child: Text(
                          'Progress',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                          ),
                      ),
                        //           Padding(
                        //   padding: const EdgeInsets.all(18.0),
                        //   child: LinearPercentIndicator( //leaner progress bar
                        //             animation: true,
                        //             animationDuration: 1000,
                        //             lineHeight: 30.0,
                        //             percent:percent/100,
                        //             center: Text(
                        //               percent.toString() + "%",
                        //               style: TextStyle(
                        //                   fontSize: 12.0,
                        //                   fontWeight: FontWeight.w600,
                        //                   color: Colors.black),
                        //             ),
                        //             linearStrokeCap: LinearStrokeCap.roundAll,
                        //             progressColor: welcomepageLightBlue,
                        //             backgroundColor: Colors.grey[300],
                        //           ),
                        // ),
                ],
              ),
            ),
            
             Positioned(
                
            child: Padding(              
              padding: EdgeInsets.only(top: 230),
              child: Center(
           
              child: Container(
                height: 250,
                width: size.width* 0.85,                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
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
                  child:  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:18.0, right:18, bottom: 1, top: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'mathematics'
                              ),
                               IconButton(
                                  icon: Icon(Icons.expand_more),
                                  color: Colors.blue,
                                  onPressed: (){}
                                ),
                                
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:1.0,left:18,right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(
                                  'Number of modules',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                                ),
                            ),
                                  Text(
                                'Completed',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                          ],
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left:18.0, right: 18, top: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '21',
                                style: TextStyle(fontSize: 60, 
                                color: Colors.grey[600]),
                              ),
                                  Text(
                                '7',
                                style: TextStyle(fontSize: 60, 
                                color: Colors.grey[600]),
                              ),
                          ],
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left:18.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SafeArea(
                              child: MyOvalGradientButton(
                                placeHolder: 'More courses', 
                                pressed: (){ 
                                  MyNavigate.navigatejustpush(HomePage(), context);
                                }, 
                                firstcolor: welcomepageBlue, secondcolor: welcomepageLightBlue,),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          ),
            )
              ),
            
            ]
          ),
        ),
      ),
      );
  }
}


class MySmallContainer extends StatelessWidget {
  final String? title;
  final Function? onClick;
  const MySmallContainer({
    Key? key,
    required this.size,this.title, this.onClick
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () { 
              onClick!(); 
          },
      child: Container(
        
      height: 100,
      width: size.width* 0.4,                  
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 30,
                spreadRadius: 0,
                offset: Offset(10,20)
              )
            ]
          ),   
          child: Center(
      child: Text(
          title!,
          style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
                    ),   
      ),
    );
  }
}