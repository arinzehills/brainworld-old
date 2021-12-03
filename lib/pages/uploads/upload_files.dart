import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/my_button.dart';
import 'package:brainworld/components/normal_curve_container.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/models/user.dart';
import 'package:brainworld/home_page.dart';
import 'package:flutter/material.dart';

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

    List<UserData> title =[
    UserData(title: 'title',leading: Icons.person),
    UserData(title: 'phone',leading: Icons.mobile_friendly),
    UserData(title: 'email',leading: Icons.email_outlined),
    UserData(title: 'address',leading: Icons.location_on),


  
  ];
  
 String dropdownValue = 'Select Category';
  
  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;

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
                        style: TextStyle(color: Colors.white, fontSize: 15),),
                        
                            ],
                          ),),
                      ),
                      ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Form(
                                                child: Wrap(                    
                              // mainAxisAlignment: MainAxisAlignment.center,
                                     children: <Widget>[
                                         rangeList(),
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
                                           padding: const EdgeInsets.all(18.0),
                                           child: Container(
                                                 width: MediaQuery.of(context).size.width * 0.87,
                                                 height:  46,
                                                 child: TextFormField(
                                                  // validator: (val)=> val!.length < 6 ? 'Enter a valid password' : null,  
                                               decoration:InputDecoration(
                                                            fillColor: Colors.white,
                                                            hintText: 'Tags',
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
                                                                                    onPressed: () {
                                                                                    
                                                                                    },
                                                                                ),             
                                                                          fillColor: Colors.white,
                                                                          hintText: 'Add Image(s)(optional)',                                                                        
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
                                           padding: const EdgeInsets.all(18.0),
                                           child: Container(
                                                 width: MediaQuery.of(context).size.width * 0.87,
                                                 height:  46,
                                                   child:TextFormField(
                                                         readOnly:true,
                                                  // validator: (val)=> val!.length < 6 ? 'Enter a valid password' : null,                                                   
                                                   decoration:InputDecoration(
                                                                suffixIcon:IconButton(
                                                                          icon: const Icon(Icons.video_library),
                                                                          color:homepageBlue,
                                                                          onPressed: () {
                                                                          
                                                                          },
                                                                      ),             
                                                                          fillColor: Colors.white,
                                                                          hintText: 'Add Video(s)(optional)',                                                                        
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
                                           padding: const EdgeInsets.all(18.0),
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
                                                                          onPressed: () {
                                                                          
                                                                          },
                                                                      ),             
                                                                          fillColor: Colors.white,
                                                                          hintText: 'Add File(s)(optional)',                                                                        
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
                                                        // setState(() =>password=val);
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
                placeHolder: 'UPLOAD', 
                pressed: (){
                  // MyNavigate.navigatepushuntil(EditUploadFiles(), context);
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
  List<String> categorylist=[
      'customer fee for withdrawal',
      ' pos fee for withdrawal',
      'pos fee for transfer'
    ];
  Widget rangeList() {
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
}