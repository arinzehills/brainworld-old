import 'package:brainworld/components/custom_sliver_delegate.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:brainworld/pages/uploads/upload_detail.dart';
import 'package:brainworld/pages/uploads/upload_files.dart';
import 'package:flutter/material.dart';
class UploadListPage extends StatefulWidget {
    final bool isUser;
    
    UploadListPage({ 
      required this.isUser,
   });

  @override
  _UploadListPageState createState() => _UploadListPageState();
}

class _UploadListPageState extends State<UploadListPage> {
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
                        aligncontainerwidget: MyListContainer(title: 'Total number of UploadListPage',),
                        widget2: SizedBox(),
                        title: 'Mathematics ',
                        searchHint: 'mathematics uploads',
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
                                MyNavigate.navigatejustpush(UploadDetail(), context);
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
                                                         if(widget.isUser==true) Padding(
                                                        padding: const EdgeInsets.only(right: 10.0, top:0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                        IconButton(
                                                                icon : Icon(Icons.edit),
                                                                color: homepageBlue, 
                                                                onPressed: () { 
                                                                  MyNavigate.navigatejustpush(UploadFiles(), context);
                                                                 },                                                            
                                                              ),
                                                         Flexible(
                                                                 child: IconButton(                                                                 
                                                                  icon : Icon(Icons.delete),
                                                                  color: Colors.red, 
                                                                  onPressed: () {  },                                                            
                                                                                                                             ),
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
                    sub_title ?? 'UploadListPage...',
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