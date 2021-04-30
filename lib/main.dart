import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/registration.dart';
import 'screens/chat.dart';
import 'screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChatApp());
}

class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  void SomethingWentWrong() {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }
        if (snapshot.connectionState != ConnectionState.done) {
          return Text('Loading');
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          initialRoute: WelcomeScreen.id,
          routes: {
            WelcomeScreen.id: (context) => WelcomeScreen(),
            LoginPage.login: (context) => LoginPage(),
            RegistrationPage.registration: (context) => RegistrationPage(),
            ChatPage.chat: (context) => ChatPage(),
          },
        );
      },
    );
  }
}
