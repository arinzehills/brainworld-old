import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/normal_curve_container.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/constants/loading.dart';
import 'package:brainworld/models/myuser.dart';
import 'package:brainworld/models/user_detail.dart';
import 'package:brainworld/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/profile_list.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({ Key? key }) : super(key: key);

  
  @override
  _EditProfileState createState() => _EditProfileState();
}
class UserData{
  String title;
  IconData? leading;
  UserData({required this.title, this.leading});

}
class _EditProfileState extends State<EditProfile> {


  
  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
    final user= Provider.of<MyUser>(context);


    return StreamBuilder<UserDetail>(
     stream: DataBaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserDetail? userData= snapshot.data ;
              List<UserData> title =[
                UserData(title: userData!.name,leading: Icons.person),
                UserData(title: userData.phone,leading: Icons.mobile_friendly),
                UserData(title: userData.email,leading: Icons.email_outlined),
                UserData(title: 'address',leading: Icons.location_on),
                UserData(title: 'password',leading: Icons.password),
              ];
        return Scaffold(
          drawer: MyDrawer(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  
                  Builder(
                  builder:(context)=> Column(
                    children: [
                      NormalCurveContainer(
                        size: size,
                        height: size.height * 0.24,
                        pagetitle: 'Edit Profile',
                        imageUrl: 'assets/back_button.png',
                        widget: Padding(
                          padding: const EdgeInsets.only(top:18.0),
                          child: Center(child: Text('Arinze Hills',
                          style: TextStyle(color: Colors.white, fontSize: 30),),),
                        ),
                        ),
                           Padding(
                             padding: const EdgeInsets.only(top:28.0),
                             child: ListView.separated(
                                itemCount: title.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 16),
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index){
                                  return ProfileList(
                                    name: title[index].title,
                                    leading: title[index].leading,
                                    suffix:Icons.edit ,
                                  );
                                },
                                 separatorBuilder: (BuildContext context, int index) => 
                                 Container(
                                     height: 2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [ homepageLightBlue,homepageBlue]
                                        )
                                        ),
                              ),
                             ),
                           ),
                            Container(
                                   height: 2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [ homepageLightBlue,homepageBlue]
                                      )
                                      ),
                            ),
                    ],
                  ),
                ),
                
                 Positioned(
                    
                child: Padding(              
                  padding: EdgeInsets.only(top: size.height * 0.18),
                            child: Center(           
                            child:    ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(50)),                                        
                                            child: Image.asset(
                                              "assets/user_blue.png",
                                              height: 90,
                                              )
                                                          ),
                        ),
                )
                 ),
                 Positioned(
                    
                child: Padding(              
                  padding: EdgeInsets.only(
                    top:size.height*0.8),
                  child: Center(           
                  child: MyGradientButton(
                    placeHolder: 'Update', 
                    pressed: (){}, 
                    firstcolor: homepageBlue,
                     secondcolor: homepageLightBlue
                     )
              ),
                )
                 )
                ]
              ),
            ),
          ),
          );
      }
      else{
          return Loading();
        }
      }); 

  }
}