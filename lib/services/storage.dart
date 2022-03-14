import 'dart:typed_data';

import 'package:brainworld/models/user_detail.dart';
import 'package:brainworld/pages/chats/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path; 
import 'package:http/http.dart' as http;

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';


class FirebaseApi{
  static FirebaseStorage _storage = FirebaseStorage.instance;
  // Reference _rootReference = _storage.ref();
      static UploadTask? uploadfile(String destination, File file){
            try{
            
            final ref =FirebaseStorage.instance.ref(destination);

            return ref.putFile(file);
            } on FirebaseException catch(e){
              return null;
            }  
          }
         static  DownloadTask? downLoadFile(Reference ref,File file)  {
              try{
           
              var result= ref.writeToFile(file);
              return result;
              }
              catch(e){
                print(e);
              }
          }
            static UploadTask? uploadVideo(String destination,File video){
            try{
            
            final ref =FirebaseStorage.instance.ref(destination);

            return ref.putFile(video);
            } on FirebaseException catch(e){
              return null;
            }  
          }
          
          // static Stream<List<UserDetail>> getUsers(){
          //   QuerySnapshot<Map<String, dynamic>> snapshots= FirebaseFirestore.instance
          //   .collection('chats')
          //   .doc()
          //   .collection('collectionPath')
          //   .orderBy('ChatUsers.time', descending: true)
          //   .snapshots();
            
          //         DocumentSnapshot  document=snapshots.
          //                            dynamic uploadsData=document.data();


          //   }

            static UploadTask? uploadBytes(String destination, Uint8List data){
            try{
            
            final ref =FirebaseStorage.instance.ref(destination);

            return ref.putData(data);
            } on FirebaseException catch(e){
              return null;
            }  
          }
        
}