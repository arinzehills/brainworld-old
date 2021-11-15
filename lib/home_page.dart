import 'package:brainworld/components/custom_sliver_delegate.dart';
import 'package:brainworld/components/drawer.dart';
import 'package:brainworld/components/my_curve_container.dart';
import 'package:brainworld/components/my_gradient_button.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;


    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
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
                                'Welcome Back!, ',
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
                  SliverFillRemaining(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Categories'),
                        HorizontalListView(size: size),
                        Text('Categories'),
                        HorizontalListView(size: size),
                        Text('Categories'),
                        HorizontalListView(size: size),
                      ],
                    ),
                  ),
                  
                ],
              ),
              ]
          ),
        ),
      
      );

  }
}

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return             Flexible(
      child: Padding(
            padding: EdgeInsets.only(top: 0, left: 30,right: 0, bottom: 10),
            child:ListView.builder(          
              scrollDirection: Axis.horizontal,
              
              physics: ScrollPhysics(),
                itemCount: 4,
                shrinkWrap: false,
                    //  shrinkWrap: true,
                    //  padding: EdgeInsets.only(top: 10,bottom: 10),
                    //  physics: NeverScrollableScrollPhysics(),
                     itemBuilder: (context, index){
                       return
                       Padding(
                    padding: const EdgeInsets.only(top: 0.0,left: 10, right: 10, bottom: 10),
                    child: 
                        Container(
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
                Text('Sciences',style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
                        ),
                        )
                );
                     }
            ),
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