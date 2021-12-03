import 'package:flutter/material.dart';
class MyListContainer extends StatelessWidget {
  final String title;
  final String? sub_title;
  const MyListContainer({
    Key? key, required this.title, this.sub_title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
                      title,
                       overflow: TextOverflow.visible,
                      style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                      ),
            ),
          SizedBox(height: 5,),
          Text(
                    sub_title ?? '14 uploads',
                    style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                    ),
          )
        ],
      ),
    );
  }
}