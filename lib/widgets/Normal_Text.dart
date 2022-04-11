import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Normal_Text extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  Normal_Text(
      {Key? key, this.size = 15, required this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
