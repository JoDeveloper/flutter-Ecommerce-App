import 'package:ecommerce/components/products_list.dart';
import 'package:ecommerce/components/single_product.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  int items = 0;
  Products({this.items});
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

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


