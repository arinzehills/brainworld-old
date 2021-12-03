import 'package:brainworld/components/custom_sliver_delegate.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/my_curve_container.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/pages/uploads.dart';
import 'package:brainworld/pages/uploads/upload_list_page.dart';
import 'package:flutter/material.dart';
import 'package:brainworld/constants/my_navigate.dart';

class Library extends StatefulWidget {
  const Library({ Key? key }) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  // get welcomepageBlue => null;

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
                        aligncontainerwidget: MyListContainer(title: 'Sciences',),
                        title: 'Library',
                        alignment: Alignment(0.0, 1.0),
                        searchHint: 'library',
                        curveContainerHeight:size.height* 0.43,
                        showHorizontalScrollList: true
                      ),
                    ),
                  
                  SliverToBoxAdapter(
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
                                MyNavigate.navigatejustpush(UploadListPage(isUser:false,), context);
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
                                                  child: MyListContainer(title: 'Mathematics')
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


class MySmallContainer extends StatelessWidget {
  final String? title;
  const MySmallContainer({
    Key? key,
    required this.size,this.title
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}