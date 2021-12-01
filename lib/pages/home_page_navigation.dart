import 'package:brainworld/authentications/user/dashboard.dart';
import 'package:brainworld/authentications/user/profile.dart';
import 'package:brainworld/constants/constants.dart';
import 'package:brainworld/pages/library.dart';
import 'package:brainworld/pages/uploads.dart';
import 'package:flutter/material.dart';

import 'chat.dart';


class HomePageNavagation extends StatefulWidget {
      final int? index;

  const HomePageNavagation({ Key? key, this.index }) : super(key: key);

  @override
  _HomePageNavagationState createState() => _HomePageNavagationState();
}

class _HomePageNavagationState extends State<HomePageNavagation> {
   late int _selectedIndex = widget.index ?? 0;
  
  List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Uploads(),
    Chat(),
    Library(),
    Profile()    
  ];

@override
  void initState() {
    super.initState();
    // var index = widget.index;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            //  drawer: MyDrawer(),
            bottomNavigationBar:BottomNavigationBar(              
            items:<BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                    size: 25,
                  ),
                label: 'Dashboard',
                activeIcon: RadiantGradientMask(
                  child: Icon(
                      Icons.dashboard_customize_outlined,
                      size: 30,
                      color: Colors.white,
                      )
                    )
              ),
              BottomNavigationBarItem(
                icon:  ImageIcon(
                  AssetImage('assets/uploads_blue.png'),
                    size: 30,
                  ),
                label: 'Uploads',
                activeIcon: RadiantGradientMask(
                  child: Icon(
                      Icons.backup_outlined,
                      size: 30,
                      color: Colors.white,
                      )
                    ),
              ),
              BottomNavigationBarItem(
                icon:  ImageIcon(                  
                  AssetImage(
                    'assets/chat_blue.png',
                    ),
                    size: 30,
                  ),
                label: 'Chat',
                   activeIcon: RadiantGradientMask(
                  child: Icon(
                      Icons.chat,
                      size: 30,
                      color: Colors.white,
                      )
                    ),
              ),
                 BottomNavigationBarItem(
                icon:  ImageIcon(
                  AssetImage('assets/library_blue.png'),
                    size: 30,
                  ),
                label: 'Library',
                   activeIcon: RadiantGradientMask(
                  child: ImageIcon(
                          AssetImage('assets/library_blue.png'),
                            size: 30,
                          ),
                    ),
              ),
               BottomNavigationBarItem(
                icon:  ImageIcon(
                  AssetImage('assets/user_blue.png'),
                    size: 30,
                  ),
                label: 'Profile',
                   activeIcon: RadiantGradientMask(
                  child: Icon(
                      Icons.account_circle,
                      size: 30,
                      color: Colors.white,
                      )
                    ),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: welcomepageLightBlue,
            unselectedItemColor: Colors.grey[400],
            onTap: _onItemTapped,
            
          ),
           body: _widgetOptions.elementAt(_selectedIndex),
        );
  }
}
class RadiantGradientMask extends StatelessWidget {

  RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.bottomLeft,
          radius: 0.5,
          colors: <Color>[
            
            welcomepageLightBlue,
            welcomepageBlue,
            welcomepageLightBlue,

          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}