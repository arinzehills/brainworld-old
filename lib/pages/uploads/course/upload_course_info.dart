import 'dart:io';

import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/my_button.dart';
import 'package:brainworld/components/normal_curve_container.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/pages/uploads/course/model/course.dart';
import 'package:brainworld/pages/uploads/course/upload_course.dart';
import 'package:brainworld/services/storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path; 

class UploadCourseInfo extends StatefulWidget {
  const UploadCourseInfo({ Key? key }) : super(key: key);

  
  @override
  _UploadCourseInfoState createState() => _UploadCourseInfoState();
}
class _UploadCourseInfoState extends State<UploadCourseInfo> {


  // late final File? imagefile;
  // late final File? videofile;
   File? file;
   File? image;
 String dropdownValue = 'Select Category';
 String packageDropdownValue = 'Select package';
 String packageError = '';
 String dropdownError = '';
 String error='';
 String imageUrl='';
   List<File>? files;
  List<String> filenames=[];
  
  String title='';
  String description='';
  String price='';
  String tag='';
 List<String> tags= [];//collecct the arrays of sub-titles
  //  File? video;
 String category = 'Select Category';
    bool showPackagePrice=false; //this shows the form field to enter price
  final _formKey = GlobalKey<FormState>();
  bool _multiPick = false;

  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
     final String imagename=image!=null ? Path.basename(image!.path) 
                                          : 'course landing page Image(optional)';
    //  final String videoname='Add Intro Video(s)(optional)';
      String filename='';
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
     Widget errorWidget(error)=>  Padding(
                                              padding: const EdgeInsets.only(left:12.0),
                                              child: Text(
                                                error,
                                                style: TextStyle(
                                                  color:Colors.red
                                                ),
                                              ),
                                            );
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
                              Text('ADD COURSE INFORMATION',
                        style: TextStyle(color: Colors.white, fontSize: 15),),
                        
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
                                        child: Column(
                                          children: [
                                            Container(
                                                     width: MediaQuery.of(context).size.width * 0.87,
                                                     height:  46,
                                                       child: TextFormField(
                                                      // validator: (val)=> val!.length < 6 ? 'Enter a valid password' : null,  
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
                                          ],
                                        ),
                                         ) : SizedBox(),
                                         Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Container(
                                                 width: MediaQuery.of(context).size.width * 0.87,
                                                 height:  46,
                                                   child: TextFormField(
                                                  validator: (val)=> val!.isEmpty ? 
                                                                  'Enter course title' : null,  
                                               decoration:InputDecoration(
                                                            errorStyle: TextStyle(
                                                              fontSize: 0.1
                                                            ),
                                                            fillColor: Colors.white,
                                                            hintText: 'Course Title',
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
                                                  validator: (val)=> val!.isEmpty ? 'Enter ' : null,  
                                               decoration:InputDecoration(
                                                            fillColor: Colors.white,
                                                            hintText: 'Tags',
                                                            errorStyle: TextStyle(
                                                              fontSize: 0.1
                                                            ),
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
                                                            setState(() =>tag=val);
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
                                                  // validator: (val)=> val!.length < 6 ? 'Enter a valid password' : null,                                                   
                                               decoration:InputDecoration(
                                                    suffixIcon:IconButton(
                                                              icon: const Icon(Icons.image),
                                                              color:homepageBlue,
                                                              onPressed:selectImage                                                            
                                                          ),             
                                                    fillColor: Colors.white,
                                                    hintText: imagename,                                                                        
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
                                           padding: const EdgeInsets.all(18.0).copyWith(bottom: 0),
                                           child: Container(
                                                 width: MediaQuery.of(context).size.width * 0.87,
                                                 height:  46,
                                                   child:TextFormField(
                                                         readOnly:true,
                                                  // validator: (val)=> val!.length < 6 ? 'Enter a valid password' : null,                                                   
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
                                                            // setState(() =>password=val);
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
                                                
                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Container(
                                                 width: MediaQuery.of(context).size.width * 0.87,
                                          
                                                   child: TextFormField(
                                                        validator: (val)=> val!.isEmpty ? 
                                                                  'Enter Brief Description *' : null,
                                                        keyboardType: TextInputType.multiline,                                              
                                                        maxLines: 5,                                                                                            
                                                        decoration:InputDecoration(
                                                                      fillColor: Colors.white,
                                                                      hintText: 'Course Description',
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
                placeHolder: 'CONTINUE', 
                pressed: (){
                  print('tag ' + tag);
                  for (var word in tag.split(' ')){
                    tags.add(word);
                  };
                    print('tags '+ tags.toString());
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
                                    if(dropdownValue=='Select Category'){
                                          //no package seleceted
                                          setState(() {
                                            dropdownError='Please select a category';
                                          });
                                        }
                                        else{
                                          setState(() {
                                          dropdownError='';
                                        });
                                        // var user=currentuser(context).uid;
                                          // print(user);
                                          Course course=Course(
                                            usersid: '',
                                            courseType: 'course',
                                            price:price==''? '0' : price,
                                            category:dropdownValue,                                            
                                             package: packageDropdownValue,  
                                            courseTitle: title,
                                            description: description,                                       
                                              tags: tags, 
                                              image: image,
                                              filenames: filenames,
                                              );
                                              print('course.courseTitle ' +course.tags.toString());
                                          MyNavigate.navigatejustpush(
                                            UploadCourse(
                                              courseinfo: course,
                                            ), context);
                                          setState(() {
                                            tags=[];
                                          });
                                        }
                                          
                                          
                                        }else{
                                          setState(() {
                                            error='Please enter missing inputs';
                                          });
                                        }
                      
                    
                  
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
          value: dropdownValue,
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
              dropdownValue = newValue!;
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
   Future selectFile() async{
          setState(() {
            filenames.clear();
          });
      if(_multiPick){
      final result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf','doc' ], allowMultiple: true,
        type: FileType.custom
        );
       setState(() => files = result!.paths.map((path) => File(path!)).toList());
       files!.forEach((file) { 
          final fileName = Path.basename(file.path);
          setState(() {
            filenames.add(fileName);
          }); 
          print('filenames2 '+filenames.toString());          
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
            filenames.add(fileName);
          });
         
      }
      
          print('documentnames '+ filenames.toString());
    }
    Future selectImage() async{         
          
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        );
         if (result == null) return;
      final path = result.files.single.path!;      
       setState(() => image = new File(path));        
       print('image ' + image!.toString());
        final fileName = Path.basename(file!.path);
          print('filenames '+fileName);          
      
         
    }
}