import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubit/Cubits.dart';
import 'package:project1/widgets/App.dart';
import 'package:project1/widgets/Buttons.dart';
import 'package:project1/widgets/Large_text.dart';
import 'package:project1/widgets/Normal_Text.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int stars = 4;
  int selectedindex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/tulip.jpg"),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<Cubits>(context).gohome();
                        },
                        icon: const Icon(Icons.menu),
                        color: Colors.black)
                  ],
                )),
            Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 800,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Large_text(
                            text: "Tulip",
                            color: Colors.black,
                          ),
                          Large_text(
                            text: "Details",
                            color: Colors.black,
                          )
                        ],
                      ),
                      SizedBox(height: 1),
                      Row(
                        children: [
                          Normal_Text(
                            text: "'You'll find the perfect love in a tulip.'",
                            size: 12,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(Icons.star,
                                  color: stars > index
                                      ? Color.fromARGB(255, 153, 74, 100)
                                      : Colors.grey);
                            }),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Normal_Text(text: "(4.0)"),
                        ],
                      ),
                      SizedBox(height: 20),
                      Large_text(
                        text: "Category",
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Normal_Text(text: "Choose your favorite color", size: 11),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: App(
                                size: 50,
                                color: selectedindex == index
                                    ? Color.fromARGB(255, 232, 186, 237)
                                    : Colors.black,
                                backgroundColor: selectedindex == index
                                    ? Color.fromARGB(255, 116, 90, 110)
                                    : Color.fromARGB(255, 116, 75, 104),
                                borderColor: Colors.black,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Normal_Text(text: "Every number refers to a color"),
                      SizedBox(
                        height: 5,
                      ),
                      Normal_Text(text: "1- Purple tulips"),
                      Normal_Text(text: "2- Red tulips"),
                      Normal_Text(text: "3- Creamy tulips"),
                      Normal_Text(text: "4- White tulips"),
                      Normal_Text(text: "5- Yellow tulips"),
                    ],
                  ),
                )),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    App(
                      size: 50,
                      color: Color.fromARGB(255, 116, 90, 110),
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                      iconD: Icons.favorite_border,
                      isIcon: true,
                    ),
                    SizedBox(width: 10),
                    Buttons(
                      isResponsive: true,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
