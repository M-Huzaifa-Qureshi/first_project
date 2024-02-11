import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Text('Welcome Drawer Item',style: TextStyle(
          fontSize: 30,fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
