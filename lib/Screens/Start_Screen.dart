import 'dart:math';
import '../widget/My_button.dart';
import 'package:flutter/material.dart';
import 'package:project_name/Screens/LogIn_screen.dart';
import 'package:project_name/Screens/signUp_screen.dart';




class start_screen extends StatefulWidget {
  static String ScreenRout ='start_screen';
  const start_screen({super.key});

  @override
  State<start_screen> createState() => _start_screenState();
}

class _start_screenState extends State<start_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 140,
                width: 120,
                child: Image.asset('images/start_img.png'),
              ),
              
               const Center(
                 child:  Text('Massage Me',style: TextStyle(
                   color:  Color(0xFF2e5f79),
                   fontSize: 30,
                   fontWeight: FontWeight.w600,
                   ),),
               ),
            const SizedBox(height:22,),
             MyButton(title: 'Sign Up', Buttoncolor: const Color(0xFF2596BE),
              fun: (){
                Navigator.pushNamed(context, SignUp.ScreenRout);
              }),
             const SizedBox(height:22,),
             MyButton(title: 'log in', Buttoncolor: const Color.fromARGB(255, 152, 195, 229) ,
              fun: (){
                  Navigator.pushNamed(context, LogIn_screen.ScreenRout);
                  
              })
            
            ],
           
          ),
        ),
    );
  }
}

