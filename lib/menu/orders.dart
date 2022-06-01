import 'package:flutter/material.dart';

import 'package:product_catalogue/menu/products.dart';

import '../const.dart';
import 'chatpage.dart';

import 'else.dart';
import 'homepage.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int pageIndex = 1;
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
    return Scaffold(
      bottomNavigationBar: BuildNavbar(context),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }

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
