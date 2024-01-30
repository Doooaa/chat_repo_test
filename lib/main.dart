import 'package:cloud_firestore/cloud_firestore.dart';

import 'Screens/Start_Screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_name/Screens/chats_screen.dart';
import 'package:project_name/Screens/LogIn_screen.dart';
import 'package:project_name/Screens/signUp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.settings;
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:  Color.fromARGB(255, 24, 147, 214),),
        useMaterial3: true,
      ),
     // home:Chat(),
      initialRoute: start_screen.ScreenRout,
       routes: {
        start_screen.ScreenRout :(context)=> start_screen(),
        LogIn_screen.ScreenRout :(context)=> LogIn_screen(),
       SignUp.ScreenRout :(context)=> SignUp(),
      Chat.ScreenRout:(context)=> Chat(),
       },
    );
  }
}
