import 'package:brainworld/models/notes_model.dart';
import 'package:brainworld/models/user_detail.dart';
import 'package:brainworld/pages/uploads/course/model/course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DataBaseService{
//collection reference
    //normal users collection  refrenrence
    final CollectionReference usersCollection=FirebaseFirestore.instance.collection('users');
      final String uid;
      DataBaseService({
      required this.uid, 
    });

        Future updateUserData(String user_name, String phone,String email) async {
          // var status = await OneSignal.shared.getPermissionSubscriptionState();
   
                                        
      return await usersCollection.doc(uid).set({
            'uid':uid,
            'user_name' : user_name,
            'phone': phone,
            'email' :email,
          
          });
        }
            // users data from snapshot
    UserDetail _userDataFromSnapshot(DocumentSnapshot snapshot){
          dynamic  data= snapshot.data();
            return UserDetail(
              uid: uid,
            name:data['user_name'] ?? '',
            phone: data['phone'] ?? '',
            email: data['email'] ?? '',
            address: data['address']
          //  role: data['role'],           
          );

    }
         //get users Stream
    Stream<UserDetail> get userData{
      return usersCollection.doc(uid).snapshots()
      .map(_userDataFromSnapshot );
    }

      final CollectionReference notesCollection=FirebaseFirestore.instance.collection('notes');
      //function that add new notes
      Future addUserNote(String title,String description, docid) async{
        if(docid==null){
         return 
         await notesCollection.doc(uid).collection('user_notes').add({
            'title':title,
            'description' : description,
            'TimeStamp':DateTime.now(),
            'Time':DateFormat.jm().format(DateTime.now()),
          });
        }else{
          return 
         await notesCollection.doc(uid).collection('user_notes').doc(docid).update({
            'title':title,
            'description' : description,
          });
        }
      }
      //function that updates old notes
      //   Future updateUserNote(String title,String description, String docid) async{
      //    return 
      //    await notesCollection.doc(uid).collection('user_notes').doc(docid).update({
      //       'title':title,
      //       'description' : description,
      //     });
      // }
      List<NotesModel> _notesFromSnapshot(QuerySnapshot snapshot){
        dynamic  data= snapshot.docs;
            return data;
      }
          Stream<List<NotesModel>> get userNotes{
      return notesCollection.doc(uid).collection('user_notes').snapshots().
      map(_notesFromSnapshot);
    }

    final CollectionReference uploadsCollection=FirebaseFirestore.instance.collection('uploads');
     

        Future addUploadData(String category, String title,String tags, String description,
        String price,  List<String> downloadLink, List<String> documentname,List<String> filetype,) async {
          // var status = await OneSignal.shared.getPermissionSubscriptionState();
      return await uploadsCollection.doc(uid).collection('user_uploads').add({
            'uid':uid,
            'category':category,
            'tags' : tags,
            'title' : title,
            'price' : price,
            'description': description,
            'downloadLink' :downloadLink,  
              'documentname':documentname,
              'filetype': filetype,
            'TimeStamp':DateTime.now(),
            'Time':DateFormat.jm().format(DateTime.now()),      
          });
        }

        
        Future addCourse(Course courses) async {
           final CollectionReference coursesCollection=FirebaseFirestore.instance.collection('courses');
           
           return
            await  uploadsCollection.doc(uid).collection('user_uploads').add(courses.toJson());
        }
           
}