import 'dart:io';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/myoval_gradient_button.dart';
import 'package:brainworld/components/normal_curve_container.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/models/myuser.dart';
import 'package:brainworld/pages/uploads/course/model/course.dart';
import 'package:brainworld/services/database.dart';
import 'package:brainworld/services/storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

import '../uploads.dart'; 

class UploadFiles extends StatefulWidget {
  const UploadFiles({ Key? key }) : super(key: key);

  
  @override
  _UploadFilesState createState() => _UploadFilesState();
}
class UserData{
  String title;
  IconData? leading;
  UserData({required this.title, this.leading});

}
class _UploadFilesState extends State<UploadFiles> {

   File? file;
   List<File>? files;
   UploadTask? task;
   bool uploadingFinish=false;
  final _formKey = GlobalKey<FormState>();


  String title='';
  String description='';
  String price='';
  String tag='';
  //  File? video; 
  String packageError = '';
 String dropdownError = '';
 String error='';
 String category = 'Select Category';
 String packageDropdownValue = 'Select package';
  bool _multiPick = false;
  List<String> documentnames=[];
  List<String> fileType=[];
  List<String> downloadLink=[];
 List<String> tags= [];//collecct the arrays of sub-titles

    bool showPackagePrice=false; //this shows the form field to enter price

  Future selectFile() async{
          setState(() {
            fileType.clear();
            documentnames.clear();
          });
      if(_multiPick){
      final result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf','doc' ], allowMultiple: true,
        type: FileType.custom
        );
       setState(() => files = result!.paths.map((path) => File(path!)).toList());
       
       String filenames='';
       files!.forEach((file) { 
          final fileName = Path.basename(file.path);
          final fileExtension=Path.extension(file.path);
          setState(() {
            fileType.add(fileExtension);
            documentnames.add(fileName);
          }); 
          filenames=filenames+ fileName+ ' /';
          print('filenames2 '+filenames);          
       });
      }else{
          
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['pdf', 'doc']);
         if (result == null) return;
      final path = result.files.single.path!;
      
       setState(() => file = new File(path));
        
       print('file ' + file!.toString());
        final fileName = Path.basename(file!.path);
          print('filenames '+fileName);
          
          final fileExtension=Path.extension(file!.path);
          // fileType.add('fileExtension '+fileExtension);
          setState(() {
            fileType.add(fileExtension);
            documentnames.add(fileName);
          });
         
      }
      
          print('fileExtension '+ fileType.toString());
          print('documentnames '+ documentnames.toString());
    }
    Future uploadFile(file,uid) async{
    
      if (file == null) return null;
      
      if(_multiPick){
        files!.forEach((file) async{
          final fileName = Path.basename(file.path);
           final destination='files/$uid/$fileName';
           task= FirebaseApi.uploadfile(destination, file);
        setState(() {});
        if(task==null) return;
        final snaphot =await task!.whenComplete(() => null);
        final urlDownload=await snaphot.ref.getDownloadURL();
         
          // setState(() {
          //   downloadLink.add(urlDownload);
          // }); 
        
        });
      }else{
        final fileName = Path.basename(file!.path);
        final destination='files/$uid/$fileName';
        task= FirebaseApi.uploadfile(destination, file);
        setState(() {});
        if(task==null) return;
        final snaphot =await task!.whenComplete(() => null);
        final  urlDownload=(await snaphot.ref.getDownloadURL());
        print(urlDownload);
        setState(() {
          downloadLink.add(urlDownload);
        });
      }
      print(downloadLink);
    }
    

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
                                              int count=0;
                                              Navigator.of(context).popUntil((_) => count++ >= 2);
                                              // MyNavigate.navigateandreplace(UploadFiles(), context);
                                              // MyNavigate.navigatejustpush(UploadFiles(), context);
                                           }) :Container(),                    
                                SizedBox(height: 14),
                    MyOvalGradientButton(placeHolder: 'Upload new file', 
                          firstcolor: homepageBlue, secondcolor: homepageLightBlue,
                          pressed: (){
                            int count = 0;

                            // Navigator.pop(context);
                            Navigator.of(context).popUntil((_) => count++ >= 2);
                            // MyNavigate.navigateandreplace(UploadFiles(), context);
                            MyNavigate.navigatejustpush(UploadFiles(), context);
                          },
                          ),
                         ],
            ),
          ),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
    final user= Provider.of<MyUser>(context);
    //  final String imagename=file!=null ? Path.basename(file!.path) : 'Add Image(s)(optional)';
    //  final String videoname=video!=null ? Path.basename(video!.path) : 'Add Video(s)(optional)';
      
   String filename='';// set the hinttext file name

      //if it multipick
      if(_multiPick){       
        if(files==null){
            setState(() {            
                 filename='Add Files(s)(optional)';
                });
         }else{
          String filenames='';
          files!.forEach((file) { 
                    final fileName = Path.basename(file.path);
                    filenames=filenames+ fileName+ ' /';
                    print('filenames2 '+filenames);
                   });
          setState(() {            
          filename= filenames; 
          });
         }
      }else{
          setState(() {
            
          filename=
              file!=null ? Path.basename(file!.path) : 
            'Add Files(s)(optional)';
          });
      }
     
     if(packageDropdownValue=='paid'){
       setState(() {
         showPackagePrice=true;
       });
     }else{
       setState(() {
         showPackagePrice=false;
       });
     }
     
     print('packageDropdownValue ' +packageDropdownValue);
     print('Multipick ' + _multiPick.toString());
    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
          child: Stack(
            children: [
              
              SingleChildScrollView(
                child: Builder(
                builder:(context)=> Column(
                  children: [
                    NormalCurveContainer(
                      size: size,
                      height: size.height * 0.27,
                      showDrawer:false,
                      container_radius:90,
                      widget: Padding(
                        padding: const EdgeInsets.only(top:0.0),
                        child: Center(
                          child: Column(
                            children: [
                               ImageIcon(
                                                AssetImage('assets/uploads_blue.png'),
                                                  size: 70,
                                                  color: Colors.white,
                                                ),
                              Text('UPLOAD',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                          
                        
                              
                            ],
                          ),),
                      ),
                      ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Form(
                                      key: _formKey,      
                                       child: Wrap(                    
                              // mainAxisAlignment: MainAxisAlignment.center,
                                     children: <Widget>[
                                      categoryList(),
                                      errorWidget(dropdownError),
                                      packageType(),
                                      errorWidget(packageError),
                                      showPackagePrice==true ? Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Container(
                                                 width: MediaQuery.of(context).size.width * 0.87,
                                                 height:  46,
                                                   child: TextFormField(
                                                  validator: (val)=> val!.isEmpty ? 'Enter price' : null,  
                                               decoration:InputDecoration(
                                                            fillColor: Colors.white,
                                                            hintText: 'Price (NGN)',
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
                                                        setState(() =>price=val);
                                                         },
                                                     ),
                                                 ),
                                         ) : SizedBox(),
                                         Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Container(
                                                 width: MediaQuery.of(context).size.width * 0.87,
                                                 height:  46,
                                                   child: TextFormField(
                                                  validator: (val)=> val!.isEmpty ? 'Enter title' : null,  
                                               decoration:InputDecoration(
                                                            fillColor: Colors.white,
                                                            errorStyle: TextStyle(
                                                              fontSize: 0.1
                                                            ),
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
                                                        setState(() =>title=val);
                                                         },
                                                     ),
                                                 ),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.all(18.0),
                                           child: Container(
                                                 width: MediaQuery.of(context).size.width * 0.87,
                                                 height:  46,
                                                 child: TextFormField(
                                                  validator: (val)=> val!.isEmpty ? 'Enter at least a tag' : null,  
                                               decoration:InputDecoration(
                                                            fillColor: Colors.white,
                                                            hintText: 'Tags(enter search tags seperated by spaces)',
                                                            hintStyle: TextStyle(
                                                                        fontSize: 14,
                                                                        ),
                                                            errorStyle: TextStyle(
                                                              fontSize: 0.1
                                                            ),
                                                            border:OutlineInputBorder(
                                                                borderSide: BorderSide(color: welcomepageLightBlue
                                                                , width: 0.1),                                                                  
                                                                borderRadius: BorderRadius.circular(10.0),                                                                
                                                            ), 
                                                                
                                                          ),
                                                        onChanged: (val){
                                                           setState(() =>tag= val );
                                                        },
                                                     ),
                                                 ),
                                         ),                                               
                                                 Padding(
                                           padding: const EdgeInsets.all(18.0).copyWith(bottom: 0),
                                           child: Container(
                                                 width: MediaQuery.of(context).size.width * 0.87,
                                                 height:  46,
                                                   child:TextFormField(
                                                         readOnly:true,                                                 
                                                   decoration:InputDecoration(
                                                                suffixIcon:IconButton(
                                                                          icon: const Icon(Icons.file_upload),
                                                                          color:homepageBlue,
                                                                          onPressed: selectFile
                                                                      ),             
                                                                          fillColor: Colors.white,
                                                                          hintText: filename,                                                                        
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
                                                            // setState(() =>nameoffile=val);
                                                        },
                                                         ),
                                                     
                                                   ),
                                                 ),
                                              Padding(
                                                padding: const EdgeInsets.all(0).copyWith(left: 15,right: 15),
                                                child: SwitchListTile.adaptive(
                                                  title: Text('Pick multiple files', textAlign: TextAlign.left),
                                                  onChanged:( (bool value) => setState(() => _multiPick = value)),
                                                  value: _multiPick,
                                                ),
                                              ),
                                                 errorWidget(error),

                                          //         Padding(
                                          //  padding: const EdgeInsets.all(18.0),
                                          //  child: Container(
                                          //        width: MediaQuery.of(context).size.width * 0.87,
                                          //        height:  46,
                                          //          child:TextFormField(
                                          //                readOnly:true,
                                          //         // validator: (val)=> val!.length < 6 ? 'Enter a valid password' : null,                                                   
                                          //          decoration:InputDecoration(
                                          //                       suffixIcon:IconButton(
                                          //                                 icon: const Icon(Icons.video_library),
                                          //                                 color:homepageBlue,
                                          //                                 onPressed: () {
                                                                          
                                          //                                 },
                                          //                             ),             
                                          //                                 fillColor: Colors.white,
                                          //                                 hintText: videoname,                                                                        
                                          //                                 hintStyle: TextStyle(
                                          //                                             fontSize: 14,
                                          //                                             ),
                                          //                                 border:OutlineInputBorder(
                                          //                                     borderSide: BorderSide(color: welcomepageLightBlue
                                          //                                     , width: 0.1),                                                                  
                                          //                                     borderRadius: BorderRadius.circular(10.0),                                                                
                                          //                                 ),
                                                                             
                                          //                               ),
                                          //               onChanged: (val){
                                          //                   // setState(() =>password=val);
                                          //               },
                                          //                ),
                                                     
                                          //          ),
                                          //        ),
                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Container(
                                                 width: MediaQuery.of(context).size.width * 0.87,
                                          
                                                   child: TextFormField(
                                                       validator: (val)=> val!.isEmpty ? 'Enter description' : null,  
                                                        // validator: (val)=> val!.length < 6 ? 'Enter Description *' : null,
                                                        keyboardType: TextInputType.multiline,                                              
                                                        maxLines: 5,                                                                                            
                                                        decoration:InputDecoration(
                                                                      fillColor: Colors.white,
                                                                      hintText: 'Description',
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
                                               ),
                                               SizedBox(height: 100,)
                                               ]
                                               ),
                                              ),
                            ),
                          )
                  ],
                ),
                          ),
              ),
             
             Align(
                alignment: Alignment.bottomCenter,
            child: Padding(              
              padding: EdgeInsets.only(
                top:size.height*0.8),
              child: Center(           
              child: MyGradientButton(
                placeHolder:  'UPLOAD' , 
                pressed: (){
                  for (var word in tag.split(' ')){
                    tags.add(word);
                  };
                  print('error'+ error);
                  if(_formKey.currentState!.validate()){ 
                      setState(() { error='';});
                     if(packageDropdownValue=='Select package'){
                                          //no package seleceted
                                          setState(() {
                                            packageError='Please select your package';
                                          });
                                        }else{ 
                                          setState(() {packageError='';});
                                          }
                                    if(category=='Select Category'){
                                          //no package seleceted
                                          setState(() {
                                            dropdownError='Please select a category';
                                          });
                                        } else{
                                          setState(() {
                                          dropdownError='';
                                        });
                                        
                                        }
                            Course course=Course(
                      usersid: user.uid, courseTitle: title,
                       courseType: 'Files', price: price==''? '0' : price,
                       description: description,
                       filenames: documentnames,
                       tags: tags,
                       );

                   uploadFile(_multiPick ? files: file,user.uid).
                  whenComplete(() =>  {
                    DataBaseService(uid: user.uid).
                     addCourse(course),
                    // DataBaseService(uid: user.uid).
                    //   addUploadData(category, title, tag, description,
                    //   price==''? '0' : price, downloadLink,documentnames,fileType),
                      
                                         }
                  );
                  // print('downloadLink');
                  // print(downloadLink);
                    task !=null ? showDialog(
                      context: context,
                      builder:(context)=> buildUploadStatus(task!)
                      ) : Container();
                      setState(() {
                                            tags=[];
                                          });   
                  }else{
                     setState(() {
                                            error='Please enter missing input(s)';
                                          });
                  }
                    
                 }, 
                firstcolor: homepageBlue,
                 secondcolor: homepageLightBlue,
                 child:Padding(
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
  Widget categoryList() {
     return Padding(
       padding: const EdgeInsets.all(18.0),
       child: Container(
         padding: EdgeInsets.only(left: 25,right: 25),
         decoration: BoxDecoration(
           border: Border.all(color: Colors.grey, width: 1),
           borderRadius: BorderRadius.circular(25)
         ),
         child: DropdownButton<String>(
          value: category,
          icon: const Icon(
            Icons.expand_more,
            color: Colors.grey,
            ),
          iconSize: 24,
          elevation: 16,
          isExpanded: true,
          style: const TextStyle(color: Colors.grey),
          underline: SizedBox(),
          onChanged: (String? newValue) {
            setState(() {
              category = newValue!;
            });
          },
          items: <String>['Select Category', 'Sciences', 'Arts',
                 'Social Sciences']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
    ),
       ),
     );
   }
 Widget errorWidget(error)=>  Padding(
                                              padding: const EdgeInsets.only(left:12.0),
                                              child: Text(
                                                error,
                                                style: TextStyle(
                                                  color:Colors.red
                                                ),
                                              ),
                                            );
  Widget packageType() {
     return Padding(
       padding: const EdgeInsets.all(18.0),
       child: Container(
         padding: EdgeInsets.only(left: 25,right: 25),
         decoration: BoxDecoration(
           border: Border.all(color: Colors.grey, width: 1),
           borderRadius: BorderRadius.circular(25)
         ),
         child: DropdownButton<String>(
          value: packageDropdownValue,
          icon: const Icon(
            Icons.expand_more,
            color: Colors.grey,
            ),
          iconSize: 24,
          elevation: 16,
          isExpanded: true,
          style: const TextStyle(color: Colors.grey),
          underline: SizedBox(),
          onChanged: (String? newValue) {
            setState(() {
              packageDropdownValue = newValue!;
            });
          },
          items: <String>['Select package', 'free', 'paid'
                 ]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
    ),
       ),
     );
   }
}