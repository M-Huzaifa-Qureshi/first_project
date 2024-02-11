import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase_project/pages/selected_page';
import 'package:newfirebase_project/pages/get_Image.dart';
import 'package:newfirebase_project/pages/login_screen.dart';
import 'package:newfirebase_project/pages/post_page.dart';
class SplashServices {
   void IsLogin(BuildContext context){
     final auth = FirebaseAuth.instance;
     final user = auth.currentUser;
     if(user!=null){
       Timer(Duration(seconds: 4),() {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PostPage(),));
       },);

     }else{
       Timer(
         Duration(seconds: 4),() {
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login_screen(),));
         },
       );
     }




  }

}
