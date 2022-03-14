import 'package:brainworld/components/custom_sliver_delegate.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/components/mylist_container.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/loading.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/models/myuser.dart';
import 'package:brainworld/models/notes_model.dart';
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:brainworld/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      bool isList=true;
    final user= Provider.of<MyUser>(context);

    return StreamBuilder<QuerySnapshot>(
      stream:  FirebaseFirestore.instance
            .collection('notes')
            .doc(user.uid)
            .collection('user_notes')
            .orderBy('TimeStamp', descending:true)
            .snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
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
                            aligncontainerwidget: MyListContainer(title: 'Total number of Notes',
                            sub_title: snapshot.data!.size.toString(),),
                            widget2: SizedBox(),
                            showaligncontainerwidget: true,
                            title: 'Notes',
                            searchHint: 'Notes',
                            alignment: Alignment(0.0, 1.59),
                            curveContainerHeight: size.height * 0.33,
                          ),
                        ),
                      SliverFillRemaining(
                        // hasScrollBody: false,
                        child:  Center(
                          child: snapshot.data!.size==0 ? Container(
                                   height: size.height * 0.31,
                                   width: size.width*0.7,
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),                
                                  boxShadow: [
                                                BoxShadow(
                                                  color: welcomepageBlue.withOpacity(0.24),
                                                  // spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(0, 5), // changes position of shadow
                                                ),
                                              ],
                                  gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [ Colors.white,Colors.white]
                                        )
                                  ),
                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                                      borderRadius: BorderRadius.all(Radius.circular(50)),                                        
                                                      child: Image.asset(
                                                        "assets/nonotes.png",
                                                        height: 110,
                                                        )
                                                ),
                                                Text(' No notes', )
                                                                
                                      ],
                                    ),
                                  
                          ) : ListView.builder(
                                     itemCount: snapshot.data!.size,
                                     shrinkWrap: true,                                     
                                     padding: EdgeInsets.only(top: snapshot.data!.size>3 ? 40 :10,bottom: 10),
                                     physics: BouncingScrollPhysics(),                                     
                                     itemBuilder: (context, index){
                                        DocumentSnapshot  document=snapshot.data!.docs[index];
                                     dynamic notesData=document.data();
                                     String title= notesData['title'];
                                     String description=notesData['description'];
                                       return Padding(
                                    padding: const EdgeInsets.only(top: 10.0,left: 30, right: 30),
                                    child: 
                                GestureDetector(
                                  onTap: (){
                                    MyNavigate.navigatejustpush(
                                      NoteDetail(docid: document.id, note_count: 1,title:  title,decription: description, ),
                                       context);
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
                                                          MyListContainer(title: notesData['title'],
                                                          sub_title: notesData['description'],),
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
                                                                      MyNavigate.navigatejustpush(
                                                                         NoteDetail(docid: document.id, note_count: 1,title:  title,decription: description, ),
                                                                             context);
                                                                     },                                                            
                                                                  ),
                                                                ),
                                                                   Flexible(
                                                                     child: IconButton(                                                                   
                                                                      icon : Icon(Icons.delete),
                                                                      color: Colors.red, 
                                                                      onPressed: () async { 
                                                                        return 
                                                                        FirebaseFirestore.instance
                                                                        .collection('notes')
                                                                        .doc(user.uid)
                                                                        .collection('user_notes')
                                                                        .doc(document.id)
                                                                        .delete();
                                                                       },                                                            
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
                   Positioned(
                    
                child: Padding(              
                  padding: EdgeInsets.only(
                    top:size.height*0.8),
                  child: Center(           
                  child: MyGradientButton(
                    placeHolder: 'Add Note', 
                    pressed: (){ MyNavigate.navigatejustpush(NoteDetail(note_count: 0), context);}, 
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
        }else{
          return Loading();
        }
        
      }
    );

  }
}