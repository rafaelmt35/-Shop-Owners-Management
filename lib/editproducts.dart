import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:product_catalogue/menu/products.dart';
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
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController stocks = TextEditingController();

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
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios, color: color4)),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            'Add Product',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: color4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  'Step 1',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Inter',
                      color: color4,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Product Image',
                      style: TextStyle(
                          color: color4, fontFamily: 'Inter', fontSize: 14),
                    ),
                    Container(
                      width: 312,
                      height: 24,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffd9d9d9)),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                        controller: imageController,
                      ),
                    )
                  ],
                ),
                width: 340,
                height: 74,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Color(0xffd9d9d9)),
                    borderRadius: BorderRadius.circular(9)),
              ),
              SizedBox(
                height: 21,
              ),
              Center(
                child: Text(
                  'Step 2',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Inter',
                      color: color4,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 340,
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Color(0xffd9d9d9)),
                    borderRadius: BorderRadius.circular(9)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Product Details',
                        style: TextStyle(
                            color: color4, fontFamily: 'Inter', fontSize: 14),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        'Product Name',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 30,
                        width: 312,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(color: color4))),
                          controller: productname,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Product Description',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: color4),
                            borderRadius: BorderRadius.circular(9)),
                        width: 312,
                        height: 83,
                        child: TextField(
                          controller: description,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Price',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 30,
                        width: 312,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              enabledBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(color: color4))),
                          controller: price,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Stocks',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 30,
                        width: 312,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              enabledBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(color: color4))),
                          controller: stocks,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: () {
                  products.add({
                    'imagename': imageController.text,
                    'Product name': productname.text,
                    'Description': description.text,
                    'Price': int.tryParse(price.text) ?? 0,
                    'Stocks': int.tryParse(stocks.text) ?? 0,
                  });
                  imageController.text = '';
                  productname.text = '';
                  price.text = '';
                  stocks.text = '';
                  description.text = '';
                  showAlertDialog(context);
                },
                child: Container(
                  width: 120,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11), color: color4),
                  child: Center(
                      child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyProducts()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Save Succsessfully"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
