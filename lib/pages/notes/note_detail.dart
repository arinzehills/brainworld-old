import 'package:brainworld/components/gradient_text.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/home_page.dart';
import 'package:brainworld/pages/notes/notes.dart';
import 'package:flutter/material.dart';

import '../home_page_navigation.dart';
class NoteDetail extends StatefulWidget {
  const NoteDetail({ Key? key }) : super(key: key);

  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  
  void _showModalBottomSheet(context){

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
             GestureDetector(
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
              Row(
               children: [
                 GestureDetector(
                   child: IconButton(
                      icon: Icon(
                            Icons.delete ,
                            color:Colors.red ,
                            size: 19.83,
                            ),
                      tooltip: 'edit',
                      onPressed: () {
                     },
                                ),
                    onTap: (){

                    },
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
            ]
          );
      });
  }
Future popUp(){
    
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
                                          onPressed:()=>{
                                            // status==true ? _emailSuccess(context) : _emailFailure(context)
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

  @override
  Widget build(BuildContext context) {
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
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
               IconButton(
            icon: Icon(
               Icons.share,
              color:homepageLightBlue,
              ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
                 IconButton(
            icon: Icon(
               Icons.more_vert,
              color:homepageLightBlue ,
              ),
            tooltip: 'Show Snackbar',
            onPressed: () {
                            _showModalBottomSheet(context);

            },
          ),
              
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
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
                                          
                                       decoration:InputDecoration(
                                                              fillColor: Colors.white,
                                                              hintText: 'Title',
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
                                                // setState(() =>password=val);
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
                                                // setState(() =>password=val);
                                            },
                              ),
                                         ),
                                       ),])))
    );
  }
}