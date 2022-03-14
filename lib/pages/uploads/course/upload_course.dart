import 'dart:io';

import 'package:brainworld/components/basic_tile_page.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/gradient_text.dart';
import 'package:brainworld/components/my_button.dart';
import 'package:brainworld/components/myoval_gradient_button.dart';
import 'package:brainworld/components/normal_curve_container.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:brainworld/pages/uploads.dart';
import 'package:brainworld/pages/uploads/course/model/course.dart';
import 'package:brainworld/pages/uploads/course/model/course_tile.dart';
import 'package:brainworld/pages/uploads/upload_files.dart';
import 'package:brainworld/services/database.dart';
import 'package:brainworld/services/storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path; 

class UploadCourse extends StatefulWidget {
   Course? courseinfo;
  IconData? leading;
  UploadCourse({
    this.courseinfo,
    });

  
  @override
  _UploadCourseState createState() => _UploadCourseState();
}
class UserData{
 

}
class _UploadCourseState extends State<UploadCourse> {
    File? video;
    final List<File> videos=[];
     final coursescontents= <CourseTile>[];
     final List<String> videonames= [];
     final List<String> subtitles= [];//collecct the arrays of sub-titles
     UploadTask? task;
     UploadTask? imagetask;
     String sub_title='';
     String error='';
     String imageURl='';
      String videoname='Add a Video';
    bool showaddContentWidget=false;

  Future selectFile() async{
      final result = await FilePicker.platform.
      pickFiles(type: FileType.video,
        allowMultiple: false,
        );

      if (result == null) return;
      final path = result.files.single.path!;
       setState(() => video = new File(path));
        final fileName = Path.basename(video!.path);
        setState(() {
          videoname=fileName.split('.').first;
          videonames.add(fileName);
          // videos.add(video!);
        });
          print('filenames '+fileName.split('.').first);
          
          print('videos '+videos.toString());
    }
    
   Future uploadCourse(uid,File? image) async{
      if(videonames==[]) return;
      if(videos==null) return;
      
      videos.forEach((video) {
          final documentname = Path.basename(video.path);
           final destination='courses/$uid/$documentname';
           task= FirebaseApi.uploadVideo(destination, video);
        setState(() {});
        if(task==null) return;
        final snaphot =task!.whenComplete(() => null);
       
      });
    //   if(image==null) return;
    //   final imagename = Path.basename(image.path);
    //        final destination='courses/$uid/$imagename';
    //        task= FirebaseApi.uploadVideo(destination, image);
    //     // setState(() {});
    //     if(task==null) return;
    //   var snaphot =await task!.whenComplete(() => null);
    //  String  url=(await snaphot.ref.getDownloadURL());
    //   setState(() {
    //     imageURl=url;
    //   });
    }
    addintoallarrays(coursename,
                          sub_title){

                    coursescontents.add(
                                        CourseTile(
                                          title: sub_title,
                                          tiles: [CourseTile(title: coursename)
                                          ]
                                          )
                                 );
                    subtitles.add(
                        sub_title
                    );
    }
  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
     var user=currentuser(context).uid;
          // print('user');
          // print(user);
     print('my videos '+videos.toString());
    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
          child: Stack(
            children: [              
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Builder(
                builder:(context)=> Column(
                  children: [
                    NormalCurveContainer(
                      size: size,
                      height: size.height * 0.17,
                      showDrawer:false,
                      container_radius:90,
                      widget: Padding(
                        padding: const EdgeInsets.only(top:0.0),
                        child: Center(
                          child: Column(
                            children: [
                               ImageIcon(
                                                AssetImage('assets/uploads_blue.png'),
                                                  size: 50,
                                                  color: Colors.white,
                                                ),
                              Text('UPLOAD COURSE',
                        style: TextStyle(color: Colors.white, fontSize: 15),),
                        
                            ],
                          ),),
                      ),
                      ),
                      //check if user has started adding course contents
                     coursescontents.isNotEmpty? courseTileWidget() : noCourseContents(),                
                            GestureDetector(
                              onTap: (){
                                // coursescontents.add(value)
                                print(showaddContentWidget);
                              if(showaddContentWidget==false){
                                setState(() {
                                  showaddContentWidget=true;
                                });
                              }else{
                                setState(() {
                                  showaddContentWidget=false;
                                });
                              }
                              print(videos);
                              },
                              child: plusButton(coursescontents)
                              ),
                          //this widgets shows or hides if the user
                          //hits the plus button to add contents
                          showaddContentWidget==true ? 
                            addCourseContents(): SizedBox()

                  ],
                ),
                          ),
              ),
            coursescontents.isEmpty || showaddContentWidget==true 
                ? SizedBox(): Align(
                alignment: Alignment.bottomCenter,
            child: Padding(              
              padding: EdgeInsets.only(
                top:size.height*0.8),
              child: Center(           
              child: MyGradientButton(

                placeHolder: 'UPLOAD', 
                pressed: (){
                  Course courses=Course(
                    usersid:user ,
                    courseType: 'course',
                     courseTitle:widget.courseinfo!.courseTitle,
                     description: widget.courseinfo!.description,
                     price: widget.courseinfo!.price,
                     category: widget.courseinfo!.category,
                      package: widget.courseinfo!.package,
                       tags: widget.courseinfo!.tags, 
                       imageURL: imageURl,
                       videonames: videonames,
                       filenames: widget.courseinfo!.filenames,
                       subTitles:subtitles ,
                      
                       );
                        uploadCourse(user, widget.courseinfo!.image).
                  whenComplete(() =>  {  DataBaseService(uid: user)
                        .addCourse(courses),
                    task !=null ? showDialog(
                      context: context,
                      builder:(context)=> buildUploadStatus(task!)
                      ) : Container(),
                                    
                                         });
                                                        
                    
                }, 
                firstcolor: homepageBlue,
                 secondcolor: homepageLightBlue,
                 child:       Padding(
                                             padding: const EdgeInsets.only(left:18.0),
                                             child: ImageIcon(
                                              AssetImage('assets/uploads_blue.png'),
                                                size: 50,
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
    
  final _formKey = GlobalKey<FormState>();

    Widget addCourseContents()=> SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Form(
                                      key: _formKey,      
                                       child: Wrap(                    
                              // mainAxisAlignment: MainAxisAlignment.center,
                                     children: <Widget>[                                      
                                         Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Container(
                                                 width: MediaQuery.of(context).size.width * 0.87,
                                                 height:  46,
                                                   child: TextFormField(
                                                  validator: (val)=> val!.isEmpty ? 'Enter title' : null, 
                                                   
                                               decoration:InputDecoration(
                                                               errorStyle: const TextStyle(fontSize: 0.2),
                                                            hintText: 'Title'
                                                            '(E.g Introduction to mathematics)',
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
                                                        setState(() =>sub_title=val);
                                                         },
                                                     ),
                                                 ),
                                         ),
                                        Padding(
                                           padding: const EdgeInsets.all(18.0),
                                           child: Container(
                                                 width: MediaQuery.of(context).size.width * 0.87,
                                                 height:  46,
                                                   child:TextFormField(
                                                         readOnly:true,                                     
                                                  // validator: (val)=> val=='Add a Video' ? 'Please select a video' : null,                                                                                                  
                                                   decoration:InputDecoration(
                                                               errorStyle: const TextStyle(fontSize: 0.2),                                 
                                                                suffixIcon:IconButton(
                                                                          icon: const Icon(Icons.video_library),
                                                                          color:homepageBlue,
                                                                          onPressed: selectFile
                                                                      ),             
                                                                          fillColor: Colors.white,
                                                                          hintText: videoname,                                                                        
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
                                                            // setState(() =>videoname=val);
                                                            // print('onchange');
                                                        },
                                                         ),
                                                     
                                                   ),
                                                 ),   
                                            Padding(
                                              padding: const EdgeInsets.only(left:12.0),
                                              child: Text(
                                                error,
                                                style: TextStyle(
                                                  color:Colors.red
                                                ),
                                              ),
                                            ),     
                                            SizedBox(height: 10,),
                                            Padding(
                                              padding: EdgeInsets.all(0.0).copyWith(right: 40),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  MyOvalGradientButton(
                                                         placeHolder: 'Add',
                                                          pressed: (){
                                                            if(_formKey.currentState!.validate()){ 
                                                              if(videoname=='Add a Video'){
                                                                //no video seleceted
                                                                print(videoname +'is add');
                                                                setState(() {
                                                                  error='Please select a video';
                                                                });
                                                              }
                                                              else{
                                                                //if video is selected
                                                                addintoallarrays
                                                                (videoname, sub_title);
                                                                videos.add(video!);
                                                                print(subtitles);
                                                                print('videonames '+ 
                                                                videonames.toString());
                                                                setState(() {
                                                                  error='';
                                                                  showaddContentWidget=false;
                                                                  videoname='Add a Video';
                                                                });
                                                              }                
                                                            }
                                                          },
                                                           firstcolor: homepageBlue, 
                                                           secondcolor: homepageLightBlue),
                                                ],
                                              ),
                                            ),
                                           
                                               
                                               ]
                                               ),
                                              ),
                            ),
                          );
   Widget noCourseContents()=>Padding(
     padding: EdgeInsets.all(8.0).copyWith(top:35),
     child: Container(
       child: Center(
          child: Column(
            children: [
              GradientText(
                'No Contents for this Course yet',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                        gradient: LinearGradient(
                          colors:[homepageBlue,homepageLightBlue],                        
                        )
                         ),
                         SizedBox(height: 20,),

              Text(
                'Start adding contents!',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 17
                ),
                )
            ],
          ),
       ),
     ),
   );
 Widget plusButton(coursesContent,)=> Padding(
                    padding: const EdgeInsets.only( right:18.0),
                    child: Row(                      
                       mainAxisAlignment: coursesContent.isEmpty ?
                                 MainAxisAlignment.center : MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(                        
                        gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [ homepageBlue,homepageLightBlue]
                                         ),                                      
                        borderRadius: BorderRadius.all(Radius.circular(100)), 
                         boxShadow: [
                                                          BoxShadow(
                                                            color: welcomepageBlue.withOpacity(0.24),
                                                            // spreadRadius: 5,
                                                            blurRadius: 10,
                                                            offset: Offset(0, 5), // changes position of shadow
                                                          ),
                                                        ],
                     ),
                     child: Center(
                         child: Icon(
                           Icons.add,
                           color: Colors.white,)
                     ),
                  
               ),
     ],
   ),
 );
     
    Widget courseTileWidget()=>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
         physics: ScrollPhysics(),
        children: coursescontents.map((course) => 
            CourseTileWidget(course:course, 
            pressed: ()=>{
               coursescontents.remove(course.title)
               
            },
            ))
            .toList(),
      ),
    );
    
           Widget buildUploadStatus(UploadTask task)=>StreamBuilder<TaskSnapshot>(
          stream: task.snapshotEvents,
          builder: (context, snapshots){
            if(snapshots.hasData){
              final snap=snapshots.data!;
              final progress= snap.bytesTransferred/snap.totalBytes;
              final percentage=(progress* 100).toStringAsFixed(2);
              // print(percentage);
             
              return uploadingProgress(context, percentage);
            }else{
              return Container();
         }
             },
  );
  
Widget uploadingProgress(context, percentage){
    print('percentage');
    print(percentage);
    
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        content: Container(
          height: 244,          
          child: Center(
            child: Column(
              children: [
                                Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: ImageIcon(
                                        AssetImage('assets/uploads_blue.png'),
                                          size: 58,
                                          color: Colors.white,
                                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:10.0,top: 9),
                      child: Text(
                  'In Progress...',                  
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Text('$percentage%',
              style: TextStyle(color: Colors.black),
              ),
                    
                    SizedBox(height: 15,),
                       percentage=='100.00' ? MyOvalGradientButton(
                          
                          placeHolder: 'Check uploads',
                                           firstcolor: homepageBlue, secondcolor: homepageLightBlue
                                           , pressed: (){
                                             MyNavigate.navigateandreplace(Uploads(), context);
                                           }) :Container(),                    
                                SizedBox(height: 14),
                    MyOvalGradientButton(placeHolder: 'Upload new file', 
                          firstcolor: homepageBlue, secondcolor: homepageLightBlue,
                          pressed: (){
                            Navigator.pop(context);
                            MyNavigate.navigateandreplace(UploadFiles(), context);
                          },
                          ),
                         ],
            ),
          ),
        ),
    );
  }
}
class CourseTileWidget extends StatelessWidget {
   final CourseTile? course;
   Icon? icon;
  VoidCallback? pressed;
   CourseTileWidget({ Key? key, this.course,this.icon, this.pressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title=course!.title;
    final coursedetails=course!.tiles;

    if(coursedetails.isEmpty) {
        return
        ListTile(
          title: Text(title),
          // trailing:IconButton(
          //       icon: Icon(
          //         Icons.delete
          //         ),
          //       onPressed: pressed,
          //       color: Colors.red,
          //     ) ,
            leading:RadiantGradientMask(
              child: Icon(
                Icons.video_library,
                color: Colors.white,

              ),
            ),
            
        );
    } else{

        return
          Card(
            child: ExpansionTile(
              title: Text(title),//this is the title of the tile==course title
              children: coursedetails.map((course) => CourseTileWidget(
                //this maps the course details like video and decription
                  course:course,
                  icon: Icon(
                  Icons.video_library
                      ),)
              ).toList(),
              ),
          );
        }
    }
 
  
  
}