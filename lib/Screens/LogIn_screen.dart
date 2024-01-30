import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_name/widget/My_button.dart';
import 'package:project_name/Screens/chats_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

//sign in
class LogIn_screen extends StatefulWidget {
  static String ScreenRout = 'logIn_screen';
  const LogIn_screen({super.key});

  @override
  State<LogIn_screen> createState() => _LogIn_screenState();
}

class _LogIn_screenState extends State<LogIn_screen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String Password;
  bool showSpiner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 130,
                width: 120,
                child: Image.asset('images/start_img.png'),
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration:const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  hintText: 'Enter Your Email',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF2e5f79),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 103, 203, 228),
                      width: 2.3,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              )
              //.................................................next
              ,
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  Password = value;
                },
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  hintText: 'Enter Your Password',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF2e5f79),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 103, 203, 228),
                      width: 2.3,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MyButton(
                  title: 'LOGIN ',
                  Buttoncolor: const Color(0xFF2596BE),
                  fun: () async {
                    setState(() {
                      showSpiner = true; //on click spinner active
                    });
                    try {
                        final user =
                            await _auth.createUserWithEmailAndPassword(
                            email: email, password: Password);

                        setState(() {
                          showSpiner = false;    //user finsh the registeration stop spinner
                                                // setStat as we rebuild the body again
                        });
                        Navigator.pushNamed(context, Chat.ScreenRout);
                    } 
                    catch (e) {
                      print(e);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
