import 'package:flutter/material.dart';

const kLight = Colors.lightBlueAccent;
const kDark = Colors.blue;
const kBubbleRadius = 30.0;

const kScreenSize = TextStyle(
  fontSize: 16.0,
);

const kLogoSize = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.w900,
  color: Colors.black54,
);

const kLLogoSize = TextStyle(
  fontSize: 70.0,
  fontWeight: FontWeight.w900,
  color: Colors.black54,
);

const kTextType = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
);

const kTextFieldStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    color: Colors.black45,
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
  enabled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.lightBlueAccent, width: 1.0, style: BorderStyle.solid),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50.0),
    ),
    borderSide: BorderSide(
        color: Colors.lightBlueAccent, width: 2.0, style: BorderStyle.solid),
  ),
);

const kChatFieldStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Type your message here...',
  hintStyle: TextStyle(
    color: Colors.black26,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
  // enabled: false,
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.zero),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.zero,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.zero,
    ),
    borderSide: BorderSide.none,
  ),
);

const kChatBubbleStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
);
