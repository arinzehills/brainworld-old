import 'package:brainworld/authentications/user/dashboard.dart';
import 'package:brainworld/pages/checkout/checkout.dart';
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:brainworld/services/auth.dart';
import 'package:brainworld/welcome_page.dart';
import 'package:brainworld/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'dart:async';

import 'package:provider/provider.dart';

import 'models/myuser.dart';
Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().user,      
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomePageNavagation(),
        home: Wrapper(),
    
      ),
    );
  }
}


