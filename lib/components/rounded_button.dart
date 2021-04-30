import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.text, this.color, @required this.onPressed});

  final String text;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: kScreenSize,
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        primary: color,
        elevation: 5.0,
      ),
    );
  }
}
