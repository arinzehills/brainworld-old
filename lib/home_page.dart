import 'package:brainworld/components/custom_sliver_delegate.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/pages/cart/cart.dart';
import 'package:brainworld/pages/course/course_detail_page.dart';
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';

import 'components/gradient_text.dart';
import 'components/myoval_gradient_button.dart';
import 'constants/my_navigate.dart';
import 'models/myuser.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
     List<String> imgUrl = [
          "assets/user_blue.png",
          "assets/sciences.png",
          "assets/social.png",
          "assets/arts.png",
  ];
  
// String getCurrency() {
//   var format = NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
//   return format.currencySymbol;
// }
  void _showModalBottomSheet(context){

      showModalBottomSheet(context: context, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      builder: (context){
          return Container(child: MyCartWidget(imgUrl: imgUrl));              
          });
  }
  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
    final user= Provider.of<MyUser>(context);

        return Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: MyDrawer(),
          body: SafeArea(        
              child: Stack(            
                children: [
                  CustomScrollView(       
                    shrinkWrap: true,       
                    slivers: <Widget>[
                      SliverPersistentHeader(
                          pinned: true,                      
                          floating: true,
                          delegate: CustomSliverDelegate(
                            expandedHeight: 149,                        
                            title: 'HomePage',
                            searchHint: 'Courses',
                            alignment: Alignment(0.0, 0.9),
                            curveContainerHeight: size.height * 0.3,
                            widget2: SizedBox(),
                            title_widget: Row(
                              children: [
                                         IconButton(
                                  onPressed: ()=> {
                                  
                                    }, 
                                 icon: ImageIcon(
                                        AssetImage('assets/user_blue.png'),
                                          size: 30,
                                          color: Colors.white,
                                        ),),
                                                IconButton(
                                  onPressed: ()=> {
                                _showModalBottomSheet(context)
                                    }, 
                                 icon:  Icon(
                                    Icons.shopping_cart,
                                    size: 30,
                                    color: Colors.white,
                                    ) 
                                 )
                              ],
                            ),
                            showaligncontainerwidget: false,
                             widget1: Padding(
                              padding: const EdgeInsets.only(left:26.0, ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hii, Guest',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    ),
                                    Text(
                                    'Welcome Back!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 33,
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                                    SliverToBoxAdapter(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 30,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:  Text(
                                                'Categories',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600
                                                ),
                                                ),
                                          ),
                                          SizedBox(height: 20,),
                                          Container(
                                              height: 120.0,
                                              
                                               child:HorizontalListView(size: size,)
                                          ),
                                           SizedBox(height: 20,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:  Text(
                                                'All courses',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600
                                                ),
                                                ),
                                          ),
                                          SizedBox(height: 20,),
                                          Container(
                                              height: 120.0,
                                              width: double.infinity,
                                               child:HorizontalListView(size: size,)
                                          ),
                                          SizedBox(height: 20,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:  Text(
                                                'Popular',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600
                                                ),
                                                ),
                                          ),
                                          Container(
                                              height: 120.0,
                                               child:HorizontalListView(size: size,)
                                          ),
                                          SizedBox(height: 30,),
    
                                        ],
                                      ),
                                    ),
    
                        // SliverList(delegate: SliverChildListDelegate([
                        //   SingleChildScrollView(
                        //     child: Column(
                        //       // crossAxisAlignment: CrossAxisAlignment.start,
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: [
                                
                        //             Container(child: HorizontalListView(size: size)),
                               
                                 
                        //     //     Text('Categories'),
                        //         // HorizontalListView(size: size),
                        //     //       Text('Categories'),
                        //     //     HorizontalListView(size: size),
                        //     //       Text('Categories'),
                        //     //     HorizontalListView(size: size),
                                
                        //       ],
                        //     ),
                        //   ),
                        // ]))
                        // SliverPadding(padding: padding
                        // child),
                      SliverFillRemaining(
                        fillOverscroll: true,
                        hasScrollBody: false,
                        child:  Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                                  height: 40,
                                  width: double.infinity,
                                   decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [ homepageLightBlue,homepageBlue]
                                         )
                                       ),
                                       child: Column(
                                         children: [
                                           Text('\u00a9 2021  Brain World',
                                           style: TextStyle(color: Colors.white),),
                                           SizedBox(height: 10,),
                                           Text('Develop by Achillstechnologies(www.achillstech.top)',
                                           style: TextStyle(color: Colors.white,fontSize: 7),)
                                         ],
                                       ),
                          ),
                        )
                        ),
                      
                      
                    ],
                  ),
                  ]
              ),
            ),
          
          );
      //     ;}
      //     else{
      //   return Loading();
      // }

  }
}


class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  void _showModalBottomSheet(context){

      showModalBottomSheet(context: context, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      
    
      builder: (context){
          return
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Padding(
                      padding: const EdgeInsets.only(left:13.0),
                      child:GradientText('Options', 
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      gradient: LinearGradient(
                        colors:  [homepageBlue,welcomepageLightBlue],
                        
                      ))
                    ),
                    RadiantGradientMask(
                      child: IconButton(
                                icon: Icon(
                                   Icons.cancel_sharp,
                                  color:Colors.blue ,
                                  ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                    ),
                ],
              ),
              SizedBox(height: 10,),
                 Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyOvalGradientButton(
                          placeHolder: 'See details', 
                          pressed: (){ 
                            MyNavigate.navigatejustpush(CourseDetailPage(), context);
                          }, 
                          firstcolor: homepageLightBlue, secondcolor: homepageBlue,
                          ),
                          MyOvalGradientButton(
                          placeHolder: 'Add to cart', 
                          pressed: (){ 
                            MyNavigate.navigatejustpush(HomePage(), context);
                          }, 
                          firstcolor: homepageLightBlue, secondcolor: homepageBlue,),
                   
                ],
              ),
            
            ]
          );
      });
  }
  @override
  Widget build(BuildContext context) {
    return    Padding(
                  padding: EdgeInsets.only(top: 0, left: 10,right: 10, bottom: 10),
                  child:ListView.builder(          
                    scrollDirection: Axis.horizontal,              
                    physics: ScrollPhysics(),
                      itemCount: 10,                      
                           itemBuilder: (context, index){                             
                             return
                             Padding(
                          padding: const EdgeInsets.only(top: 0.0,left: 10, right: 10, bottom: 10),
                          child:   GestureDetector(
                            onDoubleTap: (){},//when double tap add to cart
                            onTap: (){
                              _showModalBottomSheet(context);
                            },
                            child: Container(                                
                              constraints: BoxConstraints(
                                          maxHeight: 120,
                                          ),
                                        height: 100,
                                        width: size.width* 0.28,                  
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.1),
                                                  blurRadius: 30,
                                                  spreadRadius: 0,
                                                  offset: Offset(5,20)
                                                )
                                              ]
                                          ),  
                                          child:  Center(           
                                            child:    Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(50)),                                        
                                child: Image.asset(
                                  "assets/sciences.png",
                                  height: 70,
                                  )
                                                 ),
                                                Column(
                                                  children: [
                            Text('Sciences',style: TextStyle(fontWeight: FontWeight.bold),),
                                                  ],
                                                )
                                              ],
                                            ),
                                ),
                                ),
                          )
                      );
                           }
                  ),
           
      
    );

  }
}
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
                    style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                    ),
          ),
          SizedBox(height: 5,),
          Text(
                    sub_title ?? '14 HomePage',
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