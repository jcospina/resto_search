import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget {
  final String title;
  final double rating;
  final String icon;
  Restaurant({this.title, this.rating, this.icon});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Rating: $rating'),
    );
  }
}
