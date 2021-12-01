import 'package:brainworld/components/my_text_field.dart';
import 'package:brainworld/constants/constants.dart';
// import 'package:brainworld/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:brainworld/components/drawer.dart';


class MyCurveContainer extends StatelessWidget {
  String? pagetitle;
  Widget? curvecontainerwidget1;
  Widget? curvecontainerwidget2;
  Widget? title_widget;
  String? searchHint;
  final double height;
 MyCurveContainer({
    Key? key,
    required this.size,
    this.pagetitle,
    this.curvecontainerwidget1,
    this.title_widget,
    this.searchHint,
    required this.height,
    this.curvecontainerwidget2,
    
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(top: 0),
    decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ homepageLightBlue,homepageBlue]
              )
               ),
               child:  Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     mainAxisAlignment: MainAxisAlignment.start,
                     
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top:5.0),
                         child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             IconButton(
                  onPressed: ()=> {
                   Scaffold.of(context).openDrawer()
                    }, 
                             icon: ImageIcon(
                    AssetImage('assets/menu_white.png'),
                      size: 30,
                      color: Colors.white,
                    ),
                             ),
                             Text(
                  pagetitle ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  textAlign:TextAlign.left ,
                             ), 
                             Spacer(),
                        title_widget ?? SizedBox()
                        ],
                         ),
                       ),
                       SizedBox(
                     height: 0,
                       ),
                       
                             curvecontainerwidget1 ?? SizedBox(),
                          Container(
                             width: 30,
                             padding: const EdgeInsets.only(left: 30, right: 30, top:10, bottom: 30),
                             child: TextFormField(
                  decoration: InputDecoration(
                                    hintText:'Search ${searchHint}' ,
                                     hintStyle: TextStyle(
                                       color:const  Color(0xff626262)),
                                    filled: true,
                                    fillColor:const  Color(0xfff7f7f7),
                                    focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30.0),
                                   ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30.0),
                                      ), 
                        ),
               
                  )
                  ),
                             curvecontainerwidget2 ?? SizedBox(),
                     ]
                 ),
               
    );
  }
}