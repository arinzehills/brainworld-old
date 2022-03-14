import 'package:brainworld/models/basic_tile.dart';
import 'package:brainworld/pages/home_page_navigation.dart';
import 'package:flutter/material.dart';

class BasicTilePage extends StatelessWidget {
  BasicTilePage({ Key? key }) : super(key: key);
  final basicTiles= <BasicTile>[
    BasicTile(title: 'Module 1', tiles: [
      BasicTile(title: 'Introduction to mathematics'),
      BasicTile(title: 'Introduction to matix'),
      BasicTile(title: 'Introduction to maths'),
      BasicTile(title: 'Introduction to chemistry'),
    ]),
    BasicTile(title: 'Module 2  ', tiles: [
      BasicTile(title: 'Introduction to mathematics'),
      BasicTile(title: 'Introduction to matix'),
      BasicTile(title: 'Introduction to maths'),
      BasicTile(title: 'Introduction to chemistry'),
    ]),
    BasicTile(title: 'Module 3', tiles: [
      BasicTile(title: 'Introduction to mathematics'),
      BasicTile(title: 'Introduction to matix'),
      BasicTile(title: 'Introduction to maths'),
      BasicTile(title: 'Introduction to chemistry'),
    ]),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
       physics: ScrollPhysics(),
      children: basicTiles.map((tile) => BasicTileWidget(tile:tile)).toList(),
    );
  }
}
class BasicTileWidget extends StatelessWidget {
   final BasicTile? tile;
   Icon? icon;
   BasicTileWidget({ Key? key, this.tile,this.icon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title=tile!.title;
    final tiles=tile!.tiles;

    if(tiles.isEmpty) {
        return
        ListTile(
          title: Text(title),
            leading:RadiantGradientMask(
              child: Icon(
                Icons.video_library,
                color: Colors.white,

              ),
            ),
        );
    } else{

        return
          ExpansionTile(
            title: Text(title),
            children: tiles.map((tile) => BasicTileWidget(
                tile:tile,
                icon: Icon(
                Icons.video_library
                    ),)
            ).toList(),
            );
        }
    }
}