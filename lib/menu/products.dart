import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:product_catalogue/productbox.dart';

import 'chatpage.dart';
import '../const.dart';
import '../editproducts.dart';
import 'else.dart';
import 'homepage.dart';
import 'orders.dart';
import 'package:product_catalogue/editproducts.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({Key? key}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  int pageIndex = 0;
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
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection('products');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditProduct()));
        },
        child: Icon(Icons.add),
        splashColor: color5,
        backgroundColor: color4,
        heroTag: 'Add products',
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Color(0xffD9D9D9)),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Product List',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: color4),
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 370.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Search your products',
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: products.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                            children: snapshot.data!.docs
                                .map((e) => ProductBox(
                                      (e.data() as dynamic)['Product name'],
                                      (e.data() as dynamic)['imagename'],
                                      (e.data() as dynamic)['Price'].toString(),
                                      (e.data() as dynamic)['Stocks']
                                          .toString(),
                                      (e.data() as dynamic)['Sold'].toString(),
                                      deleteItem: () {
                                        final docUser = FirebaseFirestore
                                            .instance
                                            .collection('products')
                                            .doc(e.id);
                                        docUser.delete();
                                      },
                                      updateItem: () {
                                        products.doc(e.id).update({
                                          'Sold':
                                              (e.data() as dynamic)['Sold'] - 1
                                        });
                                      },
                                    ))
                                .toList());
                      } else {
                        return Text('Loading');
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BuildNavbar(context),
    );
  }



  //BUILD NAV BAR
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
