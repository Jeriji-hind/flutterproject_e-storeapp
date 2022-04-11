import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubit/Cubits.dart';
import 'package:project1/cubit/States.dart';
import 'package:project1/main.dart';
import 'package:project1/widgets/Large_text.dart';
import 'package:project1/widgets/Normal_Text.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> with TickerProviderStateMixin {
  var images = {
    "tulip.jpg": "Tulips",
    "jasmine.jpg": "Jasmines",
    "orchid.jpg": "Orchids"
  };
  var collections = {
    "tulips.jpg": "Tulips",
    "lilacs.jpg": "Lilacs",
    "roses.jpg": "Roses"
  };
  var bouquets = {
    "bouquet1.jpg": "b1",
    "bouquet2.jpg": "b2",
    "bouquet3.jpg": "b3"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<Cubits, States>(
      builder: (context, state) {
        if (state is LoadedState) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 70, left: 25),
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<Cubits>(context).welcome();
                        },
                        icon: const Icon(Icons.menu,
                            size: 25, color: Colors.black)),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img/me.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.withOpacity(0.3)),
                    )
                  ]),
                ),
                const SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Large_text(
                    text: "Newest collection",
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator:
                          indication_point(color: Colors.black, radius: 4),
                      tabs: [
                        Tab(text: "Flowers"),
                        Tab(text: "Bouquets"),
                        Tab(text: "Offers"),
                      ]),
                )),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  height: 250,
                  width: double.maxFinite,
                  child: TabBarView(controller: _tabController, children: [
                    ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<Cubits>(context).detailsPage();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              width: 150,
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage("assets/img/" +
                                          images.keys.elementAt(index)))),
                            ),
                          );
                        }),
                    ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            // onTap: () {

                            //},
                            child: Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              width: 150,
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage("assets/img/" +
                                          bouquets.keys.elementAt(index)))),
                            ),
                          );
                        }),
                    Container(
                        child: Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      width: 150,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("assets/img/offer.png"))),
                    )),
                  ]),
                ),
                SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Large_text(
                        text: "Discover more",
                        size: 16,
                        color: Colors.black,
                      ),
                      Normal_Text(text: "See all"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 10),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage("assets/img/" +
                                            collections.keys.elementAt(index)),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Normal_Text(
                                    text: images.values.elementAt(index),
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ]);
        } else {
          return Container();
        }
      },
    ));
  }
}

class indication_point extends Decoration {
  final Color color;
  double radius;
  indication_point({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return pointpainter(color: color, radius: radius);
  }
}

class pointpainter extends BoxPainter {
  final Color color;
  double radius;
  pointpainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleoffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleoffset, radius, paint);
  }
}
