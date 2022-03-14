

import 'package:brainworld/authentications/login.dart';
import 'package:brainworld/components/gradient_text.dart';
import 'package:brainworld/components/my_button.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/components/my_text_field.dart';
import 'package:brainworld/components/no_account.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:brainworld/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Register extends StatefulWidget {
  Register({Key? key, }) : super(key: key);


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
   final AuthService _auth= AuthService();

  final _formKey = GlobalKey<FormState>();
    bool obscureText=false;
    String name='';
  String email='';
  String phone='';

    bool loading=false;

  String password='';

  String confirmPassword='';
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
                  'REGISTER',
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
                          'Full name',
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
                        MyTextField(hintText: 'Enter your full name',
                           keyboardType: TextInputType.name,
                              autovalidate: false,
                              validator: (val)=> val!.isEmpty ? 'Please Enter a Name' : null,
                              onChanged:  (val){
                                            if(mounted) {setState(() =>name=val);}
                                        },
                              ),
                                SizedBox(
                                    height:20,
                                ),
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
                           keyboardType: TextInputType.emailAddress,
                           validator: MultiValidator(
                                          [
                                            RequiredValidator(errorText: 'Required'),
                                            EmailValidator(errorText: "Enter a Valid Email")
                                          ]
                                        ),
                            autovalidate: autovalidate,
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
                           hintText: 'Enter your email',
                           value: email,
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
                           keyboardType: TextInputType.visiblePassword,
                           validator:MultiValidator(
                                      [
                                        RequiredValidator(errorText: 'Required'),
                                          MinLengthValidator(6, errorText: 'Password must be at least 6 character long'),
                                      ]
                                    ),
                              autovalidate: autovalidate,
                               onChanged:  (val){
                                           if(mounted) {setState(() =>password=val);
                                           }
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
                           value: password,
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
                          SizedBox(
                                    height:20,
                                ),
                                Text(
                                        error,
                                        style: TextStyle(color: Colors.red),
                                        ),  
                                         SizedBox(
                                    height:10,
                                ),
                        MyGradientButton(
                    placeHolder: 'Register Now',                  
                    secondcolor:const Color(0xff0b6dff),
                    firstcolor:const Color(0xff0bc9ff) ,
                    pressed: () async {

                      if(_formKey.currentState!.validate()){

                        try{
                            dynamic result= await _auth.register(name.toString().trim(),email..toString().toLowerCase().trim(), 
                                              'Update contact', password..toString().trim() );
                            if(result==null){
                              setState(() {
                                 error='Error while registering, try again!';
                              });
                            }else if(result=='[firebase_auth/email-already-in-use] The email address is already in use by another account.'){
                                  setState(() {
                                 error='The email address is already in use by another account.';
                                  });
                              } 
                              else{
                                setState(() {
                                 error='';
                                  });
                              print(result);
                                ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                          SnackBar(
                                            backgroundColor: homepageBlue,
                                            content: Text('Registered Successfully, Login')
                                              )
                                        );
                                        MyNavigate.navigatejustpush(Login(), context);
                            }
                        }catch(e){
                          setState(() {
                            error=e.toString();
                          });
                            print(e.toString());
                        }
                        
                                                  print('name is '+name);
                      print('password is '+password);
                    
                      }
                        print('email is '+email);
                      
                    },
                    ),
                    SizedBox(height: 15,),
                     NoAccount(
              title: 'Already have an account?',
              subtitle: 'LOGIN',
              pressed: (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                  Login()), (Route<dynamic> route) => false);
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