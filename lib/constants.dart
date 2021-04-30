import 'package:flutter/material.dart';

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
