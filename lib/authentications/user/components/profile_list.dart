
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:flutter/material.dart';



class ProfileList extends StatefulWidget{
  String? name;
  IconData? leading;
  IconData? suffix;
  String? imageUrl;
  ProfileList({@required this.name,@required this.leading,
  this.suffix, this.imageUrl});
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {

  bool textFieldState=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
      // Navigator.push(context, MaterialPageRoute(builder: (context){
      //     return ChatDetail();
      //   }));
     },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(widget.imageUrl!) ,
                  //   maxRadius: 30,
                  // ),
                    RadiantGradientMask(
                  child: Icon(
                      widget.leading,
                      size: 30,
                      color: Colors.white,
                      )
                    ),
                      
                  SizedBox(width: 25,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: textFieldState ==false ?  Text(widget.name!, 
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      ) : TextField(
                      decoration: InputDecoration(
                        hintText: widget.name!,
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                      
                    ),                       
                    ),
                  ),
                     RadiantGradientMask(
                  child: IconButton(
                      icon: Icon(
                        widget.suffix,
                        size: 30,
                        ),
                      color: Colors.white,
                      onPressed: (){
                       setState(() {
                            textFieldState=true;
                          });
                      },
                      )
                    ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}