import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/my_text_field.dart';
import 'package:brainworld/components/myoval_gradient_button.dart';
import 'package:brainworld/components/normal_curve_container.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:flutter/material.dart';

import 'checkout_summary.dart';

class Checkout extends StatefulWidget {
  const Checkout({ Key? key }) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;

    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
               NormalCurveContainer(
                 pagetitle: 'CHECKOUT',
                 size: size, height: size.height* 0.49,container_radius: 140,
                 widget: Padding(
                   padding: const EdgeInsets.only(left:18.0,right: 18),
                   child: Container(                 
                              height: size.height * 0.27,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),                
                              boxShadow: [
                                            BoxShadow(
                                              color: welcomepageBlue.withOpacity(0.9),
                                              // spreadRadius: 5,
                                              blurRadius: 10,
                                              offset: Offset(0, 5), // changes position of shadow
                                            ),
                                          ],
                              gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [ homepageBlue,welcomepageLightBlue]
                                    )
                              ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 10,right: 10),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       ImageIcon(
                                        AssetImage('assets/visa.png'),
                                          size: 60,
                                          color: Colors.white,
                                        ),
                                         Text('Total: 1200.00',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                                      )
                                     ],
                                   ),
                                 ),
                                Center(child: 
                                    Text('1234 5678 910 1112',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                    )
                                ,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('A.C Hills',
                                        style: TextStyle(color: Colors.white, 
                                        fontWeight: FontWeight.bold, fontSize: 15),
                                      ),
                                       Text('11/22',
                                        style: TextStyle(color: Colors.white, 
                                        fontWeight: FontWeight.bold, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                   ),
                 ),),
                                   Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 10.0, top: 20),
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
                             autovalidate: true,
                             ),
                           
                                  SizedBox(
                                      height:20,
                                  ),
                                  
                        Text(
                            'Phone',
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
                             autovalidate: true,
                             hintText: 'Enter your phone number',                         
                             ),
                           
                                  SizedBox(
                                      height:20,
                                  ),
                                  
                          Text(
                            'Address',
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
                             hintText: 'Enter your address',
                             autovalidate: true,
                             
                             ),
                           
                                  SizedBox(
                                      height:20,
                                  ),
                  Center(
                    child: MyOvalGradientButton(
                      placeHolder: 'Continue', pressed: (){
                        MyNavigate.navigatejustpush(CheckoutSummary(), context);
                      }, 
                      firstcolor: homepageBlue, secondcolor: welcomepageLightBlue),
                  )
                  ],
                ),
                )
              ],
            ),
          ),
        ),
      
    );
  }
}