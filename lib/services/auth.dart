import 'package:brainworld/models/myuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'database.dart';
class AuthService{
  
  final FirebaseAuth _auth= FirebaseAuth.instance;
   
   
  MyUser _userFromFirebaseUser(User? user){
      if (user != null)
        return MyUser(uid: user.uid);
      throw Exception();
  }
    //auth change user stream
    Stream<MyUser?> get user{
        return  _auth.authStateChanges()
        .map(_userFromFirebaseUser);
    }
    // sign in anon
  Future signInAnon() async{
    try {
      UserCredential result=  await _auth.signInAnonymously();
      User? user=result.user;
      print(user);
      return _userFromFirebaseUser(user!);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //Register with email and password    
  Future register(String name, String email, String phone,String password,) async{
      try { 
        
        UserCredential result=  await _auth.
                                createUserWithEmailAndPassword(email: email, password: password);
       User? user=result.user;
      //  create new document for the user with uid
      await DataBaseService(uid: user!.uid).updateUserData(name, phone,email);
          return _userFromFirebaseUser(user);
      } catch(e){
        // print(e);
        return e.toString();
      }
    }
  //   //SIGN In 
    Future signIn(String email, String password) async{
      try { 
        
        UserCredential result=  await _auth.
                                signInWithEmailAndPassword(email: email, password: password);
          User? user=result.user;

          return _userFromFirebaseUser(user); 
      } catch(e){
        print(e.toString());
        return null;
      }
    }
  //signout
     Future signOut() async{
    try { 
       var result= await _auth.signOut();
       return result;
    } catch(e){
      print(e.toString());
     
    }
  }
 
}
//  class UserHelper {
//     static FirebaseFirestore _db= FirebaseFirestore.instance;
//     static saveUser(User user) async{
//       Map<String, dynamic> userData={
//           "name": user.displayName,
//           "email": user.email,
//           "role": "user",
//       };
//       final userRef=_db.collection("users").doc(user.uid);
//       if((await userRef.get()).exists){

//       }else{
//         userRef.set(userData);
//       }
//     }
//   }