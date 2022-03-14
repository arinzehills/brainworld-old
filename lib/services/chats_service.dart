import 'dart:async';
import 'dart:convert';

import 'package:brainworld/models/user_detail.dart';
import 'package:brainworld/pages/chats/models/message.dart';
import 'package:brainworld/pages/chats/models/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService{
      final String uid;

      const ChatService({
        required this.uid, 
      });

     Future sendMessage(idUser,name, message, String? imageURL) async{

      final messagesReference
               =FirebaseFirestore.instance.collection('chats/$idUser/messages');
    
      try{
          final newMessage=UsersMessage(
           idUser: uid,
           name: name,
         messageText: message,
          imageURL: imageURL!,
           created_time: DateTime.now().toString(),
           );
      await messagesReference.add(newMessage.toJson( ));
      }catch(e){
          print(e);
      }
      

      // final usersReference
      //          =FirebaseFirestore.instance.collection('users');
      //       await usersReference.doc(userId).update({});
    }

    // Stream getChatUsers
      // static Stream<List<UserDetail>> getUsers() => FirebaseFirestore.instance
      // .collection('users')
      // // .orderBy(UserField.lastMessageTime, descending: true)
      // .snapshots();
      
//       Stream<UserDetail> messages(snapshot,sendersid) {
// final messagesReference
//                =FirebaseFirestore.instance.collection('chats/$sendersid/messages');
//     handleData(Event event, EventSink<UserDetail> sink) =>
//       sink.add(UsersMessage.userDataFromSnapshot(snapshot));

//   final transformer =
//       StreamTransformer<Event, UserDetail>.fromHandlers(handleData: handleData);

//   return messagesReference.onValue.transform(transformer);
// }
//      static Stream<List<UsersMessage>> getMessages(String idUser) =>
      // FirebaseFirestore.instance
      //     .collection('chats/$idUser/messages')
      //     .orderBy(MessageField.createdAt, descending: true)
      //     .snapshots()
      //     .transform(Utils.transformer(Message.fromJson));
}