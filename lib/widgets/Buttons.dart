import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/main.dart';
import 'package:project1/widgets/Large_text.dart';
import 'package:project1/widgets/Normal_Text.dart';

class Buttons extends StatelessWidget {
  bool? isResponsive;
  double? width;
  Buttons({Key? key, this.width = 100, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isResponsive == true
                ? Color.fromARGB(255, 153, 74, 100)
                : Colors.white),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.center
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20, right: 5),
                    child: Large_text(
                      text: "Place your order",
                      color: Colors.white,
                    ),
                  )
                : Container(child: Normal_Text(text: "Continue")),
          ],
        ),
      ),
    );
  }
}
