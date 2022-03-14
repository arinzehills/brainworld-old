import 'package:brainworld/constants/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child:  SpinKitThreeInOut(
            color: homepageBlue,
            size: 50.0,
           ),
        ),
    );
  }
}