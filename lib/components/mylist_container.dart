import 'package:brainworld/constants/constants.dart';
import 'package:flutter/material.dart';

class MyListContainer extends StatelessWidget {
  final String title;
  final String? sub_title;
  final String? smalltext;
  const MyListContainer({
    Key? key, required this.title, this.sub_title,this.smalltext
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(19.0).copyWith(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
                    title,
                    style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                    ),
          ),
          SizedBox(height: 5,),
          SizedBox(
            width: size(context).width * 0.56,
            child: Wrap(
              children: [
                Text(
                          sub_title ?? 'Notes...',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                          ),
                ),
              ],
            ),
          ),
          //   SizedBox(
          //   width: size(context).width * 0.56,
          //   child: Wrap(
          //     children: [
          //       Text(
          //                 smalltext ?? 'price...',
          //                 overflow: TextOverflow.ellipsis,
          //                 style: TextStyle(
          //                       color: Colors.grey,
          //                       fontSize: 10,
          //                 ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}