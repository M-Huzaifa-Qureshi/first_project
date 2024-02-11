import 'package:flutter/material.dart';
import 'package:newfirebase_project/pages/splashservices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices  splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
 splashScreen.IsLogin(context);

  }
  @override
  Widget build(BuildContext context) {
    return Image.asset('images/pxl.jpeg');
  }
}
