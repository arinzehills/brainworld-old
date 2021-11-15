import 'package:brainworld/components/custom_sliver_delegate.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/my_curve_container.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:flutter/material.dart';
class Uploads extends StatefulWidget {
  const Uploads({ Key? key }) : super(key: key);

  @override
  _UploadsState createState() => _UploadsState();
}

class _UploadsState extends State<Uploads> {
  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;


    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  SliverPersistentHeader(
                      pinned: true,
                      
                      floating: true,
                      delegate: CustomSliverDelegate(
                        expandedHeight: 250,
                        aligncontainerwidget: MyListContainer(title: 'Total number of uploads',),
                        widget2: SizedBox(),
                        title: 'Uploads',
                        searchHint: 'uploads',
                        alignment: Alignment(0.0, 0.9),
                        curveContainerHeight: size.height * 0.43,
                      ),
                    ),
                  SliverFillRemaining(
                    child: Center(
                      child: ListView.builder(
                                 itemCount: 4,
                                 shrinkWrap: true,
                                 padding: EdgeInsets.only(top: 10,bottom: 10),
                                 physics: NeverScrollableScrollPhysics(),
                                 itemBuilder: (context, index){
                                   return Padding(
                                padding: const EdgeInsets.only(top: 10.0,left: 30, right: 30),
                                child: 
                            Container(
                                            height: 90,
                                            width: size.width* 0.85,                  
                                              decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                                child: MyListContainer(title: 'Mathematics')
                                            ),                      
                              );
                                 }
                                 ),
                    ),
                  ),
                ],
              ),
               Positioned(
                
            child: Padding(              
              padding: EdgeInsets.only(
                top:size.height*0.8),
              child: Center(           
              child: MyGradientButton(
                placeHolder: 'Upload', 
                pressed: (){}, 
                firstcolor: homepageBlue,
                 secondcolor: homepageLightBlue,
                 child:Padding(
                                             padding: const EdgeInsets.only(left:18.0),
                                             child: ImageIcon(
                                              AssetImage('assets/edit_user.png'),
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                           ),
                 )
          ),
            )
             )
              ]
          ),
        ),
      
      );

  }
}
class MyListContainer extends StatelessWidget {
  final String title;
  final String? sub_title;
  const MyListContainer({
    Key? key, required this.title, this.sub_title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
                    title,
                    style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                    ),
          ),
          SizedBox(height: 5,),
          Text(
                    sub_title ?? '14 uploads',
                    style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                    ),
          )
        ],
      ),
    );
  }
}