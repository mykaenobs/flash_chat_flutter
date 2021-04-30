import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatPage extends StatefulWidget {
  static const String chat = 'chat';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  void getCurrentUser() {
    try {
      user = _auth.currentUser;
      if (user != null) {
        print('Your user name ${user.email}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Text('Chat Page $user'),
        ),
      ),
    );
  }
}
