import 'package:flutter/material.dart';
// ignore: must_be_immutable
class MyButton extends StatelessWidget {
   MyButton({
   required this.title,
   required this.Buttoncolor,
   required this.fun
  });
  final String title;
  final Color Buttoncolor;
  final VoidCallback fun;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5, 
      color:Buttoncolor,
      borderRadius:BorderRadius.circular(22),
      child:MaterialButton(
        onPressed:fun,
      child:Text(title,style: 
      const  TextStyle(
       color: Colors.white,
       fontSize: 20,
       fontWeight: FontWeight.w600,
       ),),
      ),
    );
  }
}