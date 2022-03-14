import 'package:brainworld/components/my_text_field.dart';
import 'package:brainworld/components/myoval_gradient_button.dart';
import 'package:brainworld/components/normal_curve_container.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/my_navigate.dart';
import 'package:flutter/material.dart';


class CheckoutSummary extends StatefulWidget {
  const CheckoutSummary({ Key? key }) : super(key: key);

  @override
  _CheckoutSummaryState createState() => _CheckoutSummaryState();
}

class _CheckoutSummaryState extends State<CheckoutSummary> {
  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:12.0),
          child: Column(
            children: [
             NormalCurveContainer(
                 pagetitle: 'CHECKOUT SUMMARY',
               size: size, height: size.height* 0.49,container_radius: 140,
               widget: Padding(
                 padding: const EdgeInsets.only(left:18.0,right: 18),
                 child: Container(                 
                            height: size.height* 0.29,
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
              child: Container(
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),                
                            boxShadow: [
                                          BoxShadow(
                                            color: welcomepageBlue.withOpacity(0.6),
                                            // spreadRadius: 5,
                                            blurRadius: 10,
                                            offset: Offset(0, 5), // changes position of shadow
                                          ),
                                        ],
                            color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 16),
                              physics:ScrollPhysics(),
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.only(top:12.0, left: 20, right: 20),
                                  child: Column(
                                    children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Mathematics', style: TextStyle(fontWeight: FontWeight.w500),),
                                            Text('NGN : 1200', style: TextStyle(fontWeight: FontWeight.w300),),
                                          ],
                                        )
                                    ],
                                  ),
                                );
                              },
                                ),
                                 Padding(
                                   padding: const EdgeInsets.only(bottom:20,top: 20),
                                   child: Center(
                                    child: MyOvalGradientButton(
                                      placeHolder: 'Pay ', pressed: (){
                                        MyNavigate.navigatejustpush(CheckoutSummary(), context);
                                      }, 
                                      firstcolor: homepageBlue, secondcolor: welcomepageLightBlue),
                                ),
                                 ),
                                
                              ],
                            ) ,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}