import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase_project/pages/login_screen.dart';
import 'package:newfirebase_project/pages/splashScreen.dart';
import 'package:newfirebase_project/pages/splashservices.dart';
import 'package:newfirebase_project/provider/favourite_class.dart';
import 'package:newfirebase_project/provider/provider_class.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => huzaifa()),
        ChangeNotifierProvider(create: (context) => FavouriteClass()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
