import 'package:ecommerce/Screens/Product_detail.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String name;
  final String image;
  final double oldPrice;
  final double price;

  const Product({Key key, this.name, this.image, this.oldPrice, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                    name: name,
                    oldPrice: oldPrice,
                    image: image,
                    price: price,
                  ))),
              child: GridTile(
                footer: Container(
                  height: 20.0,
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                            "\$" + name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Text("\$ $price",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}