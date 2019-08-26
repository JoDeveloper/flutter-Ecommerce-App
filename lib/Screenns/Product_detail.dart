import 'package:ecommerce/Screenns/Home.dart';
import 'package:ecommerce/components/products.dart';
import 'package:flutter/material.dart';



class ProductDetails extends StatefulWidget {
  final String name;
  final String image;
  final double oldPrice;
  final double price;

  const ProductDetails(
      {Key key, this.name, this.image, this.oldPrice, this.price})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text(widget.name),
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
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(widget.name),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        "\$" + widget.oldPrice.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.red),
                      )),
                      Expanded(
                          child: Text(
                        "\$" + widget.price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.green),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('size'),
                          content: Text(
                            'Choose size',
                            style: TextStyle(color: Colors.blue),
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              child: Text('colse'),
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                            )
                          ],
                        );
                      });
                },
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Size")),
                    Expanded(
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('color'),
                          content: Text(
                            'Choose color',
                            style: TextStyle(color: Colors.blue),
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              child: Text('colse'),
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                            )
                          ],
                        );
                      });
                },
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Color")),
                    Expanded(
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Quantity'),
                          content: Text(
                            'Choose the quantity',
                            style: TextStyle(color: Colors.blue),
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              child: Text('colse'),
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                            )
                          ],
                        );
                      });
                },
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Qty")),
                    Expanded(
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),

          Row(children: <Widget>[
            Expanded(
                child: MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              elevation: 0.2,
              onPressed: () {},
              child: Text("Buy Now"),
            )),
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              color: Colors.red,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.red,
              onPressed: () {},
            ),
          ]),

          Divider(),

          ListTile(
            title: Text("Details"),
            subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),

          Divider(),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'name',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  widget.name,
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'brand',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Brand x",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'condition',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "available",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),

          ///
          Divider(),
          Padding(
              padding: EdgeInsets.all(5.0), child: Text("Similar Products")),
          Divider(),
          Container(
            height: 320.0,
            child: Products(items: 4,),
          )
        ],
      ),
    );
  }
}
