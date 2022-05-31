import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:product_catalogue/productbox.dart';

import 'const.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final TextEditingController imageController = TextEditingController();
  final TextEditingController productname = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController stocks = TextEditingController();
  final TextEditingController sold = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection('products');

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xffD9D9D9)))),
                padding: EdgeInsets.only(top: 10),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios, color: color4)),
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
                            width: 10,
                          ),
                          Text(
                            'Store Name',
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
                            icon: Icon(Icons.menu, size: 30, color: color4)),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Add your product information',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Image',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 190,
                            child: TextField(
                              controller: imageController,
                              decoration:
                                  InputDecoration(hintText: 'Image file'),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Name',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 190,
                            child: TextField(
                              controller: productname,
                              decoration: InputDecoration(hintText: 'Name'),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 190,
                            child: TextField(
                              controller: price,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: 'All price in USD \$'),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Stocks left',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 190,
                            child: TextField(
                              controller: stocks,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(hintText: 'Left stock'),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sold',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 190,
                            child: TextField(
                              controller: sold,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(hintText: 'Sold products'),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        products.add({
                          'imagename': imageController.text,
                          'Product name': productname.text,
                          'Price': int.tryParse(price.text) ?? 0,
                          'Stocks': int.tryParse(stocks.text) ?? 0,
                          'Sold': int.tryParse(sold.text) ?? 0
                        });
                        imageController.text = '';
                        productname.text = '';
                        price.text = '';
                        stocks.text = '';
                        sold.text = '';
                      },
                      child: Container(
                        width: 120,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: color4),
                        child: Center(
                            child: Text(
                          'Add Products!',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',fontSize: 15,
                              fontWeight: FontWeight.w700),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
