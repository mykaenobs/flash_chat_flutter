import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/components/rounded_button.dart';

class LoginPage extends StatefulWidget {
  static const String login = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              style: kTextType,
              decoration: kTextFieldStyle.copyWith(
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(height: 40.0),
            RoundedButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                // Navigator.pushNamed(context, LoginPage.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
