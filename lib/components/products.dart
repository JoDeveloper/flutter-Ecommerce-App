import 'package:ecommerce/Screenns/Product_detail.dart';
import 'package:ecommerce/components/single_product.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  int items = 0;
  Products({this.items});
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer",
      "image": "images/m2.jpg",
      "oldPrice": 540.0,
      "price": 500.0
    },
    {
      "name": "back",
      "image": "images/back.jpg",
      "oldPrice": 320.0,
      "price": 280.0
    },
    {
      "name": "shirt",
      "image": "images/w3.jpeg",
      "oldPrice": 460.0,
      "price": 410.0
    },
    {
      "name": "Nicon",
      "image": "images/camera-large.jpg",
      "oldPrice": 320.0,
      "price": 280.0
    },
    {
      "name": "Iphone",
      "image": "images/phone-2.jpg",
      "oldPrice": 460.0,
      "price": 410.0
    },
    {
      "name": "Dell",
      "image": "images/desktop-4.jpg",
      "oldPrice": 320.0,
      "price": 280.0
    },
    {
      "name": "Hp",
      "image": "images/laptop-25.jpg",
      "oldPrice": 320.0,
      "price": 280.0
    },
    {
      "name": "Printer",
      "image": "images/appliance-8.jpg",
      "oldPrice": 320.0,
      "price": 280.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.items == 0 ? product_list.length : widget.items,
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int item) {
          return Product(
            name: product_list[item]['name'],
            image: product_list[item]['image'],
            oldPrice: product_list[item]['oldPrice'],
            price: product_list[item]['price'],
          );
        });
  }
}


