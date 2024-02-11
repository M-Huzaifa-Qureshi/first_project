
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerClass{
  String?title;
  IconData?icon;
  DrawerClass({
   required this.title,required this.icon,
});

}
final Draw = [
  DrawerClass(title: 'Your Favourite Item', icon: Icons.logout),
  DrawerClass(title: 'Your Favourite Item', icon: Icons.favorite_border),
];