import 'package:flutter/material.dart';


class GridItem {
  String?text;
  double? price;
  String?image;
  Color?color;


  GridItem({

    required this.color,
    required this.text,
    required this.image,
     this.price,
  });
}
final GridItems = [
  GridItem(price: 3,  text: 'Zinger Burger', image: 'images/bur.png',color: Colors.grey,),
  GridItem(price: 5,  text: 'Fish Burger', image: 'images/piz.png',color: Colors.teal,),
  GridItem(price: 6,  text: 'Chinees Burger', image: 'images/cho.png',color: Colors.yellow,),
  GridItem(price: 6,  text: 'food Burger', image: 'images/mals.png',color: Colors.deepPurple,),
GridItem(price: 10,  text: 'Zinger Burger', image: 'images/bur.png',color: Colors.grey,),
  GridItem(price: 9,  text: 'Fish Burger', image: 'images/piz.png',color: Colors.teal,),
  GridItem(price: 12,  text: 'Chinees Burger', image: 'images/cho.png',color: Colors.yellow,),
  GridItem(price: 15,  text: 'food Burger', image: 'images/mals.png',color: Colors.deepPurple,),

];