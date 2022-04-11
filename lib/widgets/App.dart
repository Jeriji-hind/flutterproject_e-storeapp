import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/widgets/Normal_Text.dart';

class App extends StatelessWidget {
  final Color color;
  String? text;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  IconData? iconD;
  bool? isIcon;

  App(
      {Key? key,
      this.isIcon = false,
      this.text = "Default",
      this.iconD,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon == false
          ? Center(child: Normal_Text(text: text!, color: Colors.white))
          : Center(
              child: Icon(
                iconD,
                color: color,
              ),
            ),
    );
  }
}
