import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference _fire = FirebaseFirestore.instance.collection('messages');
User loggedInUser;

class ChatPage extends StatefulWidget {
  static const String chat = 'chat';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String messageText;

  final messageTextController = TextEditingController();

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print('Your user name ${loggedInUser.email}');
      } else {
        print('Could not get user');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addMessage(String text, String sender) {
    return _fire
        .add({
          'text': text,
          'sender': sender,
        })
        .then((value) => print("Add Chat"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void messageStream() async {
    await for (var snapshot in _fire.snapshots()) {
      snapshot.docs.forEach((doc) {
        print(doc.data());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    messageStream();
  }

  @override
  Widget build(BuildContext context) {
    messageStream();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLight,
        title: Text('⚡ Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // _auth.signOut();
              // Navigator.pop(context);
              messageStream();
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: kLight,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: TextField(
                      controller: messageTextController,
                      style: kTextType,
                      decoration: kChatFieldStyle,
                      onChanged: (value) {
                        messageText = value;
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextButton(
                      onPressed: () async {
                        messageTextController.clear();
                        await addMessage(messageText, loggedInUser.email);
                      },
                      child: Text(
                        'Send',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: kLight,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fire.snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageBubbles = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: kLight,
            ),
          );
        }

        for (var message in snapshot.data.docs.reversed) {
          final messageText = message['text'];
          final messageSender = message['sender'];
          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(kBubbleRadius),
                    bottomLeft: Radius.circular(kBubbleRadius),
                    bottomRight: Radius.circular(kBubbleRadius),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(kBubbleRadius),
                    bottomLeft: Radius.circular(kBubbleRadius),
                    bottomRight: Radius.circular(kBubbleRadius),
                  ),
            elevation: 5.0,
            color: isMe ? kLight : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: kChatBubbleStyle.copyWith(
                  color: isMe ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
