import 'package:flutter/material.dart';

class Item {
  String?text;
  String?image;
  Color?col;

  
  Item({
required this.col,
   required this.text,
   required this.image
});
}
 final Items = [
   Item( text: 'Burger', image: 'images/bur.png',col: Colors.teal),
   Item( text: 'Burger', image: 'images/piz.png',col: Colors.deepPurple),
   Item( text: 'Burger', image: 'images/bg.jpg',col: Colors.pink),
   Item( text: 'Burger', image: 'images/bg.jpg',col: Colors.grey),
   Item( text: 'Burger', image: 'images/bg.jpg',col: Colors.lime),



 ];


// GridView
