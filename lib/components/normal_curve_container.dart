import 'package:brainworld/components/my_text_field.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:brainworld/components/drawer.dart';


class NormalCurveContainer extends StatelessWidget {
  String? pagetitle;
  Widget? widget;
  String? imageUrl;
  String? searchHint;
  double? container_radius;
  bool? showDrawer;
  final double height;
 NormalCurveContainer({
    Key? key,
    required this.size,
    this.pagetitle,
    this.widget,
    this.showDrawer,
    this.searchHint,
    this.container_radius,
    required this.height,
    this.imageUrl,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(container_radius ?? 110)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ homepageLightBlue,homepageBlue]
              )
               ),
               child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      
      children: [
        Padding(
          padding: const EdgeInsets.only(top:18.0),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(showDrawer==null) IconButton(
                onPressed: ()=> {
                 if(imageUrl==null) {
                   Scaffold.of(context).openDrawer()
                   }else{
                     Navigator.pop(context)
                   }
                  }, 
              icon: ImageIcon(
                  AssetImage(imageUrl ?? 'assets/menu_white.png'),
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
         ],
          ),
        ),
        SizedBox(
                   height: 0,
        ),
        
              widget ?? SizedBox(),
            
      ]
               ),
    );
  }
}