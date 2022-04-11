import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubit/Cubits.dart';
import 'package:project1/widgets/Normal_Text.dart';
import 'package:project1/widgets/buttons.dart';
import 'package:project1/widgets/large_text.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List images = ["page0_1.jpg", "page0_2.jpg", "page0_3.jpg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Large_text(
                            text: "The Flower Bee",
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Normal_Text(
                            text: "The best place to decorate your house",
                          ),
                          const SizedBox(height: 40),
                          Container(
                            width: 200,
                            child: Normal_Text(
                                text: "About us",
                                color: Color.fromARGB(161, 0, 0, 0),
                                size: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Normal_Text(
                              text: "lorem this is a text with no meaning",
                              color: Colors.grey,
                              size: 12),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<Cubits>(context).nextPage();
                            },
                            child: Container(
                              width: 200,
                              child: Row(
                                children: [
                                  Buttons(
                                    width: 100,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexd) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 3),
                            width: 10,
                            height: index == indexd ? 30 : 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index == indexd
                                    ? Colors.black
                                    : Colors.grey.withOpacity(0.2)),
                          );
                        }),
                      ),
                    ]),
              ),
            );
          }),
    );
  }
}
