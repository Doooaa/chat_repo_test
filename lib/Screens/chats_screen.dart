import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Chat extends StatefulWidget {
  static String ScreenRout = 'chat_screen';
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _firestore=FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  //type "User" is from firebase
  late User signedInUser;
  String? textmessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getUserName();
  }
  void getUserName() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Group Chat',
          style: TextStyle(color: Color(0xFFFFFBFB)),
        ),
        backgroundColor: const Color(0xFF2e5f79),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.exit_to_app),
            color: const Color.fromARGB(221, 255, 255, 255),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                color: const Color.fromARGB(4, 186, 111, 20),
                child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                               textmessage=value;
                          },
                          
                          keyboardType: TextInputType.text,
                          decoration: const  InputDecoration(
                            enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color:  const Color(0xFF2596BE), width: 3),
                            ),
                            hintText: 'enter your message',
                            hintStyle: TextStyle(color:Colors.black38,fontSize: 18),
                           focusedBorder:
                             OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 26, 118, 151), width: 3),
                            ),
                           
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                             print(textmessage);
                             _firestore.collection('message').add({
                              'text':textmessage,
                               'sender':signedInUser.email,
                             });
                          },
                          icon:  Icon(
                            Icons.send,
                            color: Colors.amber,
                            size: 33,
                          )),
                    ]
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
