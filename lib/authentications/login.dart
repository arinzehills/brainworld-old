

import 'package:brainworld/authentications/register.dart';
import 'package:brainworld/authentications/user/dashboard.dart';
import 'package:brainworld/components/gradient_text.dart';
import 'package:brainworld/components/my_button.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/components/my_text_field.dart';
import 'package:brainworld/components/no_account.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/home_page.dart';
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:brainworld/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Login extends StatefulWidget {
  Login({Key? key, }) : super(key: key);


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
       final AuthService _auth= AuthService();

  final _formKey = GlobalKey<FormState>();
    bool obscureText=false;
  String email='';

  String password='';
  bool autovalidate=false;
  String error='';

  @override
  Widget build(BuildContext context){
    Size size= MediaQuery.of(context).size;
          return Scaffold(
      body: SafeArea(
      child: SingleChildScrollView(
      child: Stack(
     
      children:[ 
         Positioned(
        top: -130,
        right: -159,
        child: Image.asset(
          'assets/mycurve.png',
          width:size.height * 0.805,
          height:450,
          ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [          
          Padding(
            padding: const EdgeInsets.only(top:139.0),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                    padding: EdgeInsets.all(0.0),
                    height: 100,
                     child:
                      Image.asset('assets/picture.png')
                ),
                GradientText(
                  'Login',
                  style: const TextStyle(
                    fontSize: 35
                    ),
                  gradient: LinearGradient(
                     begin: Alignment.centerRight,
                    end: Alignment.bottomRight,
                    colors: [
                    const Color(0xff00dcff),
                    const Color(0xff0837ff),                    
                  ]),                  
                ),                 
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 10.0, top: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                         Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                                SizedBox(
                                    height:10,
                                ),
                         MyTextField(
                           hintText: 'Enter your email',
                           autovalidate: autovalidate,
                           keyboardType: TextInputType.emailAddress,
                            onChanged:  (val){
                                            if(mounted) {setState(() =>email=val);}
                                        },
                           onTap: (){
                             if(autovalidate==true){
                                                    setState(() {
                                                      autovalidate=false;
                                                    });
                                                  }
                                                  else{
                                                    setState(() {
                                                autovalidate=true;   
                                                  });
                                                  }
                               },
                            validator: MultiValidator(
                                          [
                                            RequiredValidator(errorText: 'Required'),
                                            EmailValidator(errorText: "Enter a Valid Email")
                                          ]
                                        ),                        
                                     ),                       
                                SizedBox(
                                    height:20,
                                ),
                         Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                         MyTextField(
                           hintText: 'Enter password',
                           autovalidate: autovalidate,
                           keyboardType:TextInputType.visiblePassword,
                           onChanged:  (val){
                                            if(mounted) {setState(() =>password=val);}
                                        },
                           onTap: (){
                             if(autovalidate==true){
                                                    setState(() {
                                                      autovalidate=false;
                                                    });
                                                  }
                                                  else{
                                                    setState(() {
                                                autovalidate=true;   
                                                  });
                                                  }
                           },
                           obscureText:obscureText,
                            validator:MultiValidator(
                                      [
                                        RequiredValidator(errorText: 'Required'),
                                          MinLengthValidator(6, errorText: 'Password must be at least 6 character long'),
                                      ]
                                    ),
                           suffixIconButton: IconButton(
                                                icon: const Icon(Icons.visibility),
                                                color:welcomepageBlue,
                                                onPressed: () {
                                                 if(obscureText==true){
                                                    setState(() {
                                                      obscureText=false;
                                                    });
                                                  }
                                                  else{
                                                    setState(() {
                                                obscureText=true;   
                                                  });
                                                  }
                                                },
                                              ),
                                            ),
                                            Text(
                                        error,
                                        style: TextStyle(color: Colors.red),
                                        ), 
                          SizedBox(
                                    height:20,
                                ),
                        MyGradientButton(
                    placeHolder: 'Login Now',                  
                    secondcolor:const Color(0xff0b6dff),
                    firstcolor:const Color(0xff0bc9ff) ,
                    pressed: () async {
                      if(_formKey.currentState!.validate()){
                        print('password is '+password);
                        dynamic result= await _auth.signIn(email.toLowerCase().trim(),password.trim());
                            if(result==null){
                              setState(() {
                                 error='Error in Loggin in, try again!';
                              });
                            }else if(result=='[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.'){
                                        setState(() {
                                        error='invalid user name/password';
                                          
                                        });
                                        }
                                        else{
                                      print(result.uid);
                                           MyNavigate.navigatejustpush(HomePageNavagation(), context);
                                          ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                          SnackBar(
                                            backgroundColor: homepageBlue,
                                            content: Text('Logged In Successfully')
                                              )
                                        );
                            }
                            
                      }
                 
                    },
                    ),
                    SizedBox(height: 15,),
                     NoAccount(
              title: 'Already have an account?',
              subtitle: 'REGISTER',
              pressed: (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                  Register()), (Route<dynamic> route) => false);
              },
                      )  
                ],
              ),
            ),
          ),
          
        ],
      ),
      ]
    ),
  )),
);
  }
}