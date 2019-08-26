import 'package:flutter/material.dart';

class HorizonatlList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          Category(
            imageLocation: "images/desktop-4.jpg",
            imageCaption: "Desktop",
          ),
          Category(
            imageLocation: "images/appliance-8.jpg",
            imageCaption: "appliance",
          ),
          Category(
            imageLocation: "images/camera-large.jpg",
            imageCaption: "Camers",
          ),
          Category(
            imageLocation: "images/laptop-25.jpg",
            imageCaption: "Laptop",
          ),
          Category(
            imageLocation: "images/phone-1.jpg",
            imageCaption: "Phones",
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  const Category({Key key, this.imageLocation, this.imageCaption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80.0,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              width: 100.0,
              height: 60.0,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  imageCaption,
                  style: TextStyle(color: Colors.black),
                )),
          ),
        ),
      ),
    );
  }
}
