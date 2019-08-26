import 'package:ecommerce/components/products_list.dart';
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: product_list.length,
      itemBuilder: (context, index) {
        return SingleCartProduct(
          name: product_list[index]['name'],
          image: product_list[index]['image'],
          oldPrice: product_list[index]['oldPrice'],
          price: product_list[index]['price'],
        );
      },
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final String name;
  final String image;
  final double oldPrice;
  final double price;

  const SingleCartProduct(
      {Key key, this.name, this.image, this.oldPrice, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        leading: Image.asset(
          image,
          width: 80.0,
          height: 80.0,
        ),
        title: Text(name),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Size: "),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "8",
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                ///
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text("Color: "),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "red",
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                ///
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "$price \$",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 14.0),
              ),
            )
          ],
        ),
        trailing: Wrap(
          children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_drop_up),
                  onPressed: () {},
                ),
                Text("1"),
                IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
