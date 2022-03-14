import 'dart:io';

import 'package:brainworld/components/basic_tile_page.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/normal_curve_container.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/loading.dart';
import 'package:brainworld/models/myuser.dart';
import 'package:brainworld/services/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class UploadDetail extends StatefulWidget {
  String? imgurl;
  String title;  
  String? documentname;
  String? useruid;
  String? docid;
   UploadDetail({required this.title, this.imgurl, this.docid,this.documentname,this.useruid});

  
  @override
  _UploadDetailState createState() => _UploadDetailState();
}
class UserData{
  String title;
  IconData? leading;
  UserData({required this.title, this.leading, });

}
class _UploadDetailState extends State<UploadDetail> {

    List<UserData> title =[
    UserData(title: 'title',leading: Icons.person),
    UserData(title: 'phone',leading: Icons.mobile_friendly),
    UserData(title: 'email',leading: Icons.email_outlined),
    UserData(title: 'address',leading: Icons.location_on),


  
  ];
   FirebaseStorage _storage = FirebaseStorage.instance;
  
         DownloadTask? downloadTask;
          File? file;
          File? filestored;
          Reference? ref;
          
 String dropdownValue = 'Select Category';
   final _scaffoldKey = GlobalKey<ScaffoldState>();

  var res;

   Widget buildownloadStatus(DownloadTask task)=>StreamBuilder<TaskSnapshot>(
          stream: task.snapshotEvents,
          builder: (context, snapshots){
            if(snapshots.hasData){
              final snap=snapshots.data!;
              final progress= snap.bytesTransferred/snap.totalBytes;
              final percentage=(progress* 100).toStringAsFixed(2);
              // print(percentage);
             
              return downloadingProgress(context, percentage);
            }else{
              return Container();
         }
             },
  );
  Widget downloadingProgress(context, percentage){
    print('percentage ' + percentage.toString());
    // print(downloadTask!.snapshot);
    // print(downloadTask!.snapshot.state);
    return Container(         
          child: Center(
            child: Row(
              children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom:10.0,top: 9, left: 10),
                      child: Text(
                 percentage!='100.00'  ? 'In Progress...' :'holdone  in a minute done',                  
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                     Text('$percentage%',
                style: TextStyle(color: Colors.black),
                )
                    
                    // SizedBox(height: 15,),
                    //    percentage=='100.00' ? GestureDetector(
                    //      onTap: (){
                    //        openFile(filestored);
                    //      },
                    //      child: Text(' Open file',
                    //      style: TextStyle(
                    //        decoration: TextDecoration.underline,
                    //        color: Colors.blue
                    //      ),),
                    //    ) :Container(),                    
                    //             SizedBox(width: 14),
                    // GestureDetector(
                    //      onTap: (){},
                    //      child: Text(' Show in folder',
                    //      style: TextStyle(
                    //        decoration: TextDecoration.underline,
                    //        color: Colors.blue
                    //      ),),
                    //    ) 
                         ],
            ),
          ),
        
    );
  }
    Future downloadFile(useruid,filename) async{
               final   dir= await getApplicationDocumentsDirectory();
               file=File('${dir.path}/$filename');
               ref = FirebaseStorage.instance.ref('files/$useruid/$filename');
                       downloadTask =FirebaseApi.downLoadFile(ref!, file!);
              setState(() {});
               var snaphot =await downloadTask!.whenComplete(() => null);
               String  url=(await snaphot.ref.getDownloadURL());
               
              // final getFile=await savefiletostorage(url);
              // openFile(file);
              // print('getfile '+ getFile.toString());
              // setState(() {
              //  filestored= getFile;
              // });
                print(url);
                // print('filestored');
                // print(filestored);

              // openFile(filestored);
  }
    
  Future<File?> savefiletostorage(filename,useruid) async {
    
              final   dir= await getApplicationDocumentsDirectory();
              file=File('${dir.path}/$filename');
               
               print('file ' + file.toString());
               ref = FirebaseStorage.instance.ref('files/$useruid/$filename');
               print('ref ' + ref.toString());
               downloadTask =FirebaseApi.downLoadFile(ref!, file!);
                setState(() {});
               var snaphot =await downloadTask!.whenComplete(() => null);
               String  url=(await snaphot.ref.getDownloadURL());
               print(url);
      try{

      final response= await Dio().get(
          url,
          options:Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          )
        );
        final raf=file!.openSync(mode: FileMode.write);         
        raf.writeFromSync(response.data);
        await raf.close();
        setState(() {
          filestored=file;
        });
        return filestored;
      }  catch(e){
        print('get file errror ' +e.toString());
      }
    }
  static Future openFile(file) async {
    if(file==null) {
      print(null);
      return;
      }
    final url = file.path;
     
    await OpenFile.open(url);
  }
  static Future openFileifExist(file) async {
    if(file==null) {
      print(null);
      return;
      }
    final url = file.path;
     
    await OpenFile.open(url);
  }
  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
    final user= Provider.of<MyUser>(context);
    String documentname;
    String useruid;
    
    return StreamBuilder<DocumentSnapshot>(
      stream:FirebaseFirestore.instance
                    .collection('uploads')
                    .doc(user.uid)
                    .collection('user_uploads')
                    .doc(widget.docid)
                    .snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
        dynamic uploadData=snapshot.data;
          // print('data uploadData ' +uploadData['descri]']);
          return Scaffold(
          drawer: MyDrawer(),
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: homepageBlue,      
            leading:IconButton(
                    onPressed: ()=> {                 
                        _scaffoldKey.currentState!.openDrawer()                   
                       },
                  icon: ImageIcon(
                      AssetImage('assets/menu_white.png'),
                        size: 30,
                        color: Colors.white,
                      ),
                  ),
            actions: [
                 IconButton(
                icon: Icon(
                   Icons.more_vert,
                  color:Colors.white ,
                  ),
                tooltip: 'Show Snackbar',
                onPressed: () {
                                // _showModalBottomSheet(context, user.uid,widget.docid);
    
                },
              ),
            ],
            
            ),
          body:  SingleChildScrollView(
                    child: Builder(
                    builder:(context)=> Column(
                      children: [
                          SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                     uploadData['description']==null
                                     ? Container(
                                        width: double.infinity,
                                        height: size.height* 0.4,
                                        decoration: new BoxDecoration(
                                        color: Colors.transparent,
                                          image: new DecorationImage(
                                            image: AssetImage(
                                                "assets/coding.jpg"),
                                            fit: BoxFit.scaleDown,
                                          ),
                                        )
                                      ):  Column(
                                        children: [
                                          
                                          Container(
                                            width: double.infinity,
                                            height: size.height* 0.4,
                                            decoration: new BoxDecoration(
                                            color: Colors.transparent,
                                              image: new DecorationImage(
                                                image: AssetImage(
                                                    "assets/uploads_blue.png"),
                                                fit: BoxFit.scaleDown,
                                              ),
                                            )
                                          ),
                                          Text('Files',
                                          style: TextStyle(
                                              fontSize: 40,
                                              
                                          ),),
                                        ],
                                      ) ,
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0,   ),
                                              child: Text(
                                               widget.title ,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 25,
                                                ),
                                    ),
                                            ),
                                             Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                               uploadData['description']??'',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 4,
                                                style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12,
                                                ),
                                                  ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                  Icons.lock_clock,
                                                  ),
                                                   Text(
                                                  uploadData['created_time'],
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 4,
                                                  style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 12,
                                                  ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0, top: 20),
                                              child: Text(
                                                'Videos',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 25,
                                                  ),
                                               ),
                                            ),
                                        uploadData['videonames'].length==0 ?
                                             Padding(
                                              padding: EdgeInsets.all(10).copyWith(top:15),
                                            child: Text('No videos for this contents'),)
                                               :
                                            BasicTilePage(),
                                            Padding(
                                                  padding: const EdgeInsets.only(left: 8.0, top: 20),
                                                  child: Text(
                                                    'Files',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 25,
                                                      ),
                                                  )
                                             ),
                                            // ?? BasicTilePage(),
                                          uploadData['filenames'].length==0 ? 
                                   Padding(
                                              padding: EdgeInsets.all(10).copyWith(top:15),
                                            child: Text('No Files for this contents'),) 
                                            : Column(
                                              children: [
                                                 downloadTask !=null ?
                                                             buildownloadStatus(downloadTask!) : Container(),
                                                ListView.builder(
                                     itemCount: uploadData['filenames'].length,
                                     shrinkWrap: true,
                                     padding: EdgeInsets.only(top: 10,bottom: 10),
                                     physics: NeverScrollableScrollPhysics(),                                 
                                     itemBuilder: (context, index){
                                      // print   (fileExists(uploadData['documentname'][index]),);
                                        // if the file exist
                                        var fileinstorage;
                                       Directory dirrec;
                                       String path;
                                       bool iffileExists;
                                       return   Column(
                                         children: [
                                           Card(
                                                 child: ListTile(
                                                          title: Text(uploadData['filenames'][index] ??'' ),
                                                          //   leading:uploadData['filetype'][index]!='.pdf' ?  ImageIcon(
                                                          // AssetImage('assets/ms_word.png'),
                                                          //   size: 30,
                                                          //   color: Colors.blue,
                                                          // ) :
                                                          //  Icon(
                                                          //     Icons.picture_as_pdf ,
                                                          //       color: Colors.red,                                   
                                                          //     ),
                                                              trailing: IconButton(
                                                              onPressed: () async => {                 
                                                                    useruid=widget.useruid!,                                                   
                                                                    documentname =uploadData['filenames'][index],
                                                                     dirrec= await getApplicationDocumentsDirectory(),

                                                                     fileinstorage=File('${dirrec.path}/$documentname'),
                                                                      iffileExists = await File(fileinstorage.path).exists(),
                                                                      print('iffileExists ' +iffileExists.toString()),
                                                                      if(iffileExists==true){                                                                                                                                             
                                                                     openFileifExist(fileinstorage),                                                                       
                                                                      }else{    
                                                                         print('filstroe is null'),
                                                                          res=await savefiletostorage(documentname, useruid),
                                                                         print('res '+ res.toString()),
                                                                         openFile(file)                               
                                                                      },
                                                                                                     
                                                                    print('filestored '+ fileinstorage.toString()),
                                                                   
                                                                    // if(task==null) return;
                                                                    // final snaphot =await task!.whenComplete(() => null);
                                                                },
                                                             icon:  Icon(Icons.folder_open),
                                                              ) 
                                                        ),
                                           ),
                                                               
                                         ],
                                       );
                                     }
                                     ),
                                              ],
                                            ),
                                    ],
                                  )
                                ),
                              )
                      ],
                    ),
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