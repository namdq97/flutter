import 'package:flutter/material.dart';
import 'models/category.dart';

class FoodScreen extends StatelessWidget {
  late Category category;
  int number;
  FoodScreen(this.category, this.number);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text(
          'this is food ${number}',
          style: TextStyle(fontSize: 30),
        ),
      ),
      appBar: AppBar(
        title: Text('Screen ${category.content}'),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}
