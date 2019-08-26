import 'package:ecommerce/Screenns/Home.dart';
import 'package:ecommerce/components/cart_products.dart';
import 'package:flutter/material.dart';


class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text("Cart"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeApp()));
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: CartProducts(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("Total: "),
                subtitle: Text("\$ 590.0"),
              ),
            ),
            Expanded(
              child: MaterialButton(
                color: Colors.red,
                  child: Text(
                    "Checkout",
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
