import 'package:brainworld/components/custom_sliver_delegate.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:flutter/material.dart';

import 'note_detail.dart';
class Notes extends StatefulWidget {
  const Notes({ Key? key }) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
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
                        expandedHeight: 149,
                        aligncontainerwidget: MyListContainer(title: 'Total number of Notes',),
                        widget2: SizedBox(),
                        title: 'Notes',
                        searchHint: 'Notes',
                        alignment: Alignment(0.0, 0.9),
                        curveContainerHeight: size.height * 0.33,
                      ),
                    ),
                  SliverFillRemaining(
                    // hasScrollBody: false,
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
                            GestureDetector(
                              onTap: (){
                                MyNavigate.navigatejustpush(NoteDetail(), context);
                              },
                              child: Container(
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
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      MyListContainer(title: 'Mathematics'),
                                                      Padding(
                                                        padding: const EdgeInsets.only(right: 10.0, top:0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            RadiantGradientMask(
                                                              child: IconButton(
                                                                icon : Icon(Icons.edit),
                                                                color: welcomepageLightBlue, 
                                                                onPressed: () { 
                                                                  MyNavigate.navigatejustpush(NoteDetail(), context);
                                                                 },                                                            
                                                              ),
                                                            ),
                                                               IconButton(
                                                                 
                                                                icon : Icon(Icons.delete),
                                                                color: Colors.red, 
                                                                onPressed: () {  },                                                            
                                                              ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                              ),
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
                placeHolder: 'Add Note', 
                pressed: (){ MyNavigate.navigatejustpush(NoteDetail(), context);}, 
                firstcolor: homepageBlue,
                 secondcolor: homepageLightBlue,
                 child:Padding(
                                             padding: const EdgeInsets.only(left:18.0),
                                             child: ImageIcon(
                                              AssetImage('assets/pen-plus.png'),
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
                    sub_title ?? 'Notes...',
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