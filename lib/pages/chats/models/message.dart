import 'package:brainworld/models/user_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageField {
  static final String createdAt = 'createdAt';
}

class UsersMessage{
  final String idUser;
  // final String receiversid;
  final String name;
  final String messageText;
  final String imageURL;
  final String created_time;

  const UsersMessage({
    required this.idUser,
    // required this.receiversid,
  required this.name, required this.messageText, 
  required this.imageURL, required this.created_time});
   
   static UsersMessage fromJson(Map<String, dynamic> json) => UsersMessage(
        idUser: json['idUser'],
        name: json['name'] ,
        messageText: json['messageText'],
        imageURL: json['imageURL'] ,
        created_time: DateTime.parse(json['created'] as String) as String,
      );
      
       Map<String, dynamic> toJson()=>{
             'idUser': idUser,
            //  'receiversid': receiversid,
             'name': name,
            'messageText': messageText,
           'imageURL': imageURL,
           'created_time': DateTime.now().toString(),
     };
       static UserDetail userDataFromSnapshot(DocumentSnapshot snapshot){
          dynamic  data= snapshot.data();
            return UserDetail(
              uid: 'uid',
            name:data['user_name'] ?? '',
            phone: data['phone'] ?? '',
            email: data['email'] ?? '',
            address: data['address']
          //  role: data['role'],           
          );

    }
}
