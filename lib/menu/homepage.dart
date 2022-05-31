import 'package:flutter/material.dart';
import 'package:product_catalogue/const.dart';
import 'package:product_catalogue/menu/orders.dart';
import 'package:product_catalogue/menu/products.dart';

import 'chatpage.dart';
import 'else.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 2;
  final pages = [
    const MyProducts(),
    const Orders(),
    const HomePage(),
    const ChatPage(),
    const Else(),
  ];

  List<Route> myRoute = [
    MaterialPageRoute(builder: (_) => MyProducts()),
    MaterialPageRoute(builder: (_) => Orders()),
    MaterialPageRoute(builder: (_) => HomePage()),
    MaterialPageRoute(builder: (_) => ChatPage()),
    MaterialPageRoute(builder: (_) => Else())
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff3A70AF),
              Color(0xff9AB5D6),
              Color(0xff9AB5D6),
              Colors.white,
              Colors.white
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  padding: EdgeInsets.only(top: 24),
                  height: 85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 19.0),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/bag.jpeg'),
                                      fit: BoxFit.fill),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Container(
                              height: 75,
                              width: 116,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome Back,',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'DMSans',
                                        color: color4),
                                  ),
                                  Text(
                                    'Store Name,',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'DMSans',
                                        fontWeight: FontWeight.w800,
                                        color: color4),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search,
                                  size: 30, color: Colors.black)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.notifications,
                                  size: 30, color: Colors.black)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 369,
                        height: 152,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 13),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Today's update",
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, right: 5),
                                child: Container(
                                  height: 90,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '5',
                                            style: TextStyle(
                                                color: color4,
                                                fontFamily: 'Inter',
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'New Order',
                                            style: TextStyle(
                                                color: Color(0xff3A3A3A),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13),
                                          )
                                        ],
                                      ),
                                      VerticalDivider(
                                        thickness: 1,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '3',
                                            style: TextStyle(
                                                color: color4,
                                                fontFamily: 'Inter',
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Being Prepared',
                                            style: TextStyle(
                                                color: Color(0xff3A3A3A),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13),
                                          )
                                        ],
                                      ),
                                      VerticalDivider(
                                        thickness: 1,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '5',
                                            style: TextStyle(
                                                color: color4,
                                                fontFamily: 'Inter',
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'In Delivery',
                                            style: TextStyle(
                                                color: Color(0xff3A3A3A),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        width: 369,
                        height: 250,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0,bottom: 5),
                              child: Text(
                                'Statistics',
                                style: TextStyle(
                                    color: Color(0xff111111),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Inter'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                StatsBox('Net Income', '\$ 59.9', '-66.5%',
                                    Colors.red),
                                StatsBox(
                                    'Convertion', '50%', '+15.3%', Colors.green)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                StatsBox('Product View', '18', '+10.5%',
                                    Colors.green),
                                StatsBox(
                                    'Sold Product', '12', '-66.5%', Colors.red)
                              ],
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Last updated: 5/30/2022 9:45 AM',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Inter',
                                      fontSize: 11,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(
                                  width: 11,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Show more',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 22,
                                      height: 22,
                                      child: FloatingActionButton(
                                        heroTag: null,
                                        backgroundColor: Color(0xff588CDA),
                                        elevation: 0.2,
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.double_arrow_outlined,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 12, left: 18, right: 18),
                        width: 369,
                        height: 286,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'News For Seller',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'DMSans',
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ContainerNews(),
                            SizedBox(
                              height: 10,
                            ),
                            ContainerNews()
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BuildNavbar(context),
      ),
    );
  }

  Container ContainerNews() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage('images/event.jpg'),
                        fit: BoxFit.cover)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title here',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter'),
                  ),
                  Container(
                    width: 216,
                    height: 50,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id viverra neque urna est.',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Read more',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 20,
                  height: 20,
                  child: FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Color(0xff588CDA),
                    elevation: 0.2,
                    onPressed: () {},
                    child: Icon(
                      Icons.double_arrow_outlined,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      width: 331,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Container StatsBox(
      String name, String stat1, String stat2, Color colorpercent) {
    return Container(
      padding: EdgeInsets.only(left: 5),
      height: 73,
      width: 162,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 11,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter')),
            Text(stat1,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter')),
            Row(
              children: [
                Text(stat2,
                    style: TextStyle(
                        fontSize: 12,
                        color: colorpercent,
                        fontWeight: FontWeight.w600)),
                Text(' from past 7 days',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  //NEWS CONTAINER
  Container NewsContainer(String imagename, String news) {
    return Container(
      width: 372,
      height: 150,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 7,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage(imagename), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 140,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(news),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //BUILDNAVBAR
  Container BuildNavbar(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: color5,
        border: Border(
            top: BorderSide(width: 0.5, color: Colors.black.withOpacity(0.4))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavBarButton(0, 'Products', Icons.shopping_bag),
          BottomNavBarButton(1, 'Orders', Icons.note_sharp),
          BottomNavBarButton(2, 'Home', Icons.home),
          BottomNavBarButton(3, 'Chat', Icons.chat),
          BottomNavBarButton(4, 'Else', Icons.apps_sharp)
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  GestureDetector BottomNavBarButton(
      int index, String menuname, IconData iconname) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pageIndex == index;
          Navigator.of(context).pushReplacement(myRoute[index]);
        });
      },
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: pageIndex == index
              ? Colors.black.withOpacity(0.1)
              : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(iconname, color: pageIndex == index ? blue1 : Colors.black),
            Text(
              menuname,
              style: TextStyle(
                  fontSize: 14,
                  color: pageIndex == index ? blue1 : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
