import 'package:flutter/material.dart';

class ProductBox extends StatelessWidget {
  final String desc;
  final String imagename;
  final String rangeprice;
  final String stockleft;
  

  final Function updateItem;
  final Function deleteItem;

  ProductBox(
      this.desc, this.imagename, this.rangeprice, this.stockleft, 
      {required this.deleteItem, required this.updateItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 135,
        width: 366,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 6, top: 10),
                  width: 113,
                  height: 113,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(imagename), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 232,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              desc,
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            PopupMenuButton(
                              color: Colors.white,
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Text("Preview Product"),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  child: Text("Reminder"),
                                  value: 2,
                                ),
                                PopupMenuItem(
                                  child: Text("Share"),
                                  value: 3,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Text(
                        '\$' + rangeprice,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.layers,
                            size: 18,
                          ),
                          Text('Stocks left  ' + stockleft,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          SizedBox(
                            width: 17,
                          ),
                          Icon(
                            Icons.shopping_basket,
                            size: 18,
                          ),
                          Text(' Sold  5' ,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          SizedBox(
                            width: 17,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            size: 18,
                          ),
                          Text(
                            ' Seen  6',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (updateItem != null) updateItem();
                              },
                              child: Container(
                                child: Center(
                                    child: Text(
                                  'Update',
                                  style: TextStyle(fontSize: 12),
                                )),
                                height: 25,
                                width: 95,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: Color(0xffD9D9D9)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (deleteItem != null) deleteItem();
                              },
                              child: Container(
                                height: 25,
                                width: 95,
                                child: Center(
                                    child: Text(
                                  'Delete',
                                  style: TextStyle(fontSize: 12),
                                )),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: Color(0xffD9D9D9)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
