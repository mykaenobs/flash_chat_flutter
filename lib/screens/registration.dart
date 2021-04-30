import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatefulWidget {
  static const String registration = 'registration';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
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
              text: 'Register',
              color: Colors.blue,
              onPressed: () async {
                try {
                  UserCredential newUser = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushNamed(context, ChatPage.chat);
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
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
