import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/components/rounded_button.dart';

class LoginPage extends StatefulWidget {
  static const String login = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('images/logo.png'),
                height: 100.0,
              ),
            ),
            SizedBox(height: 60.0),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              style: kTextType,
              decoration: kTextFieldStyle.copyWith(
                hintText: 'Enter your email',
              ),
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              style: kTextType,
              decoration: kTextFieldStyle.copyWith(
                hintText: 'Enter your password',
              ),
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: 40.0),
            RoundedButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () async {
                try {
                  final UserCredential user =
                      await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                  if (user != null) {
                    Navigator.pushNamed(context, ChatPage.chat);
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
