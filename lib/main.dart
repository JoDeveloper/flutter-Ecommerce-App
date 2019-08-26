import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screenns/cart.dart';
import 'components/horizontal_list_view.dart';
import 'components/products.dart';

main(List<String> args) {
  runApp(MaterialApp(
    color: Colors.red,
    home: HomeApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  Widget image_carousel = new Container(
    height: 200.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/c.jpg'),
        AssetImage('images/c.jpeg'),
        AssetImage('images/w1.jpeg'),
        AssetImage('images/m2.jpg'),
        AssetImage('images/w4.jpeg'),
      ],
      dotSize: 4.0,
      dotColor: Colors.red,
      indicatorBgPadding: 6.0,
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Souk"),
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
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("Jodeveloper8@gmail.com"),
              accountName: Text("Joseph"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                title: Text("Home"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.red,
                ),
                title: Text("Account"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.red,
                ),
                title: Text("Orders"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.red,
                ),
                title: Text("my Cart"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                title: Text("Favorite"),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                title: Text("Setting"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.help_outline,
                  color: Colors.blue,
                ),
                title: Text("Help"),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          image_carousel,
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Categories"),
          ),
          HorizonatlList(),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Text("Recent Products"),
          ),
          Container(
            height: 320.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}
