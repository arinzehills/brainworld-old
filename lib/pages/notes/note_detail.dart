import 'package:brainworld/components/gradient_text.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/models/myuser.dart';
import 'package:brainworld/models/notes_model.dart';
import 'package:brainworld/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../home_page_navigation.dart';
class NoteDetail extends StatefulWidget {
   final String? docid;
   final int note_count;
   final String? title;
   final String? decription;
  const NoteDetail({ Key? key, this.docid, required this.note_count,  this.title, this.decription }) : super(key: key);
  

  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  
  void _showModalBottomSheet(context,uid, docid){

      showModalBottomSheet(context: context, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      
    
      builder: (context){
          return
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Padding(
                      padding: const EdgeInsets.only(left:13.0),
                      child:GradientText('More options', 
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      gradient: LinearGradient(
                        colors:  [homepageBlue,welcomepageLightBlue],
                        
                      ))
                    ),
                    RadiantGradientMask(
                      child: IconButton(
                                icon: Icon(
                                   Icons.cancel_sharp,
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
               padding: const EdgeInsets.only(bottom: 12.0),
               child: GestureDetector(
                 onTap: (){
                       int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
                 },
                 child: Row(
                   children: [
                     IconButton(
                        icon: RadiantGradientMask(
                          child: Icon(
                                Icons.cancel ,
                                color:homepageLightBlue,
                                size: 19.83,
                                ),
                        ),
                        tooltip: 'cancel',
                        onPressed: () {

                       },
                   ),
                    Padding(
                          padding: const EdgeInsets.only(left:13.0),
                          child: Text(
                              'Cancel changes',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                              ),
                            ),
                        ),
                   ],
                 ),
               ),
             ),
                 if(widget.docid!=null) Padding(
                   padding: const EdgeInsets.only(bottom: 28.0),
                    child: GestureDetector(
                        onTap: (){
                        print('deleted');
                        Navigator.pop(context);
                        popUp(uid, docid);
                        },
                        child: Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(left: 12),
                    child: Row(
                     children: [
                    Icon(
                                  Icons.delete ,
                                  color:Colors.red ,
                                  size: 19.83,
                                  ),
                      Padding(
                            padding: const EdgeInsets.only(left:13.0),
                            child: Text(
                                'Delete Note',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.red
                                ),
                              ),
                          ),
                     ],
                             ),
                ),
              ),
                  ),
            ]
          );
      });
  }
Future popUp(uid,docid){
    
    int count=0;
    return showDialog(
      context: context,
      builder:(context)=>AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        content: Container(
          height: 172,          
          child: Center(
            child: Column(
              children: [
                Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.red,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:17.0,top: 9),
                      child: Text(
                  'Confirm Delete?',
                  
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold
                  ),
                ),
                    ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15.0),
                  child: Text(
                    'Are you sure you want to delete?',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Roboto'
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      child: RaisedButton(
                                          child: Text(
                                             'No',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Roboto'
                                              ),
                                            ),
                                          color: welcomepageBlue,                                          
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(23)),
                                          onPressed:()=>{
                                            // status==true ? _emailSuccess(context) : _emailFailure(context)
                                          },
                                        ),
                    ),
                    Container(
                      height: 45,
                      child: RaisedButton(
                                          child: Text(
                                             'Yes',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Roboto'
                                              ),
                                            ),
                                          color: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(23)),
                                          onPressed:()=> {   
                                            FirebaseFirestore.instance
                                                      .collection('notes')
                                                      .doc(uid)
                                                      .collection('user_notes')
                                                      .doc(docid)
                                                      .delete(),
                                                    Navigator.of(context).popUntil((_) => count++ >= 2),
                                          
                                          },
                                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  String title='';
    String description='';
  final _formKey = GlobalKey<FormState>();
  late int note_count= widget.note_count==0 ? 0 : 1;
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<MyUser>(context);
    print('notecount is $note_count');
    return StreamBuilder<DocumentSnapshot>(
      stream: widget.docid==null ? null : FirebaseFirestore.instance
                    .collection('notes')
                    .doc(user.uid)
                    .collection('user_notes')
                    .doc(widget.docid)
                    .snapshots(),
      builder: (context, snapshot) {
        
        dynamic notesData=snapshot.data;
        return Scaffold(
           appBar: AppBar(
             leading:   IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back,color:homepageLightBlue,),
                    ),
            elevation: 0,
            title: Text('Note Title'),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            flexibleSpace: SafeArea(
              child: Container(
                padding: EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                  
                    SizedBox(width: 2,),  // Icon(Icons.settings,color: Colors.black54,),
                  ],
                ),
              ),
          
            ),
            actions: [
                  IconButton(
                icon: Icon(
                   Icons.save,
                  color:homepageLightBlue,
                  ),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  print('description' +description +' count $note_count' );
                  setState(() {
                    note_count=1;
                  });
              
                  try{
                      
                      DataBaseService(uid: user.uid).addUserNote(title, description,widget.docid);
                      ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                          SnackBar(
                                            backgroundColor: homepageBlue,
                                            content: Text( widget.docid==null ? 'Notes added Successfully'
                                            : 'Notes Updated Successfully')
                                              ));
                      
                        
                       
                  }catch(e){
                    print(e);
                  }
                },
              ),
                   IconButton(
                icon: Icon(
                   Icons.share,
                  color:homepageLightBlue,
                  ),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  String title=widget.title!;
                  String decription=widget.decription!;
                  Share.share(title + decription);
                },
              ),
                     IconButton(
                icon: Icon(
                   Icons.more_vert,
                  color:homepageLightBlue ,
                  ),
                tooltip: 'Show Snackbar',
                onPressed: () {
                                _showModalBottomSheet(context, user.uid,widget.docid);
    
                },
              ),
                  
            ],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
                      child: Column(                    
                          mainAxisAlignment: MainAxisAlignment.center,
                                 children: <Widget>[
                                     ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(50)),                                        
                                          child: Image.asset(
                                            "assets/logo.png",
                                            height: 90,
                                            )
                                                        ),
                                     Padding(
                                       padding: const EdgeInsets.all(18.0),
                                       child: Container(
                                             width: MediaQuery.of(context).size.width * 0.87,
                                             height:  46,
                                               child: TextFormField(
                                              // validator: (val)=> val!.length < 6 ? 'Enter a valid password' : null,
                                              initialValue: widget.docid==null ? null : widget.title,
                                             decoration:InputDecoration(
                                                            fillColor: Colors.white,
                                                            hintText:  'Title',                                                                
                                                            hintStyle: TextStyle(
                                                                        fontSize: 14,
                                                                        ),
                                                            border:OutlineInputBorder(
                                                                borderSide: BorderSide(color: welcomepageLightBlue
                                                                , width: 0.1),                                                                  
                                                                borderRadius: BorderRadius.circular(10.0),                                                                
                                                            ), 
                                                                
                                                                ),
                                                onChanged: (val){
                                                    setState(() =>title=val);
                                                },
                                                 ),
                                             ),
                                     ),   
                                             
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Container(
                                             width: MediaQuery.of(context).size.width * 0.87,
                                      
                                               child: TextFormField(
                                                    // validator: (val)=> val!.length < 6 ? 'Enter Description *' : null,
                                                    keyboardType: TextInputType.multiline, 
                                                   initialValue: widget.docid==null ? null : widget.decription,
                                                    maxLines: 20,                                                                                            
                                                    decoration:InputDecoration(
                                                                  fillColor: Colors.white,
                                                                  hintText: 'Note something down',
                                                                  hintStyle: TextStyle(
                                                                              fontSize: 14,
                                                                              ),
                                                                  border:OutlineInputBorder(
                                                                      borderSide: BorderSide(color: Colors.grey),
                                                                      
                                                                      borderRadius: BorderRadius.circular(23.0),
                                                                  ), 
                                                                     
                                                                ),
                                                onChanged: (val){
                                                    setState(() =>description=val);
                                                },
                                  ),
                                             ),
                                           ),])))
        );
      }
    );
  }
}