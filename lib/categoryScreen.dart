import 'package:flutter/material.dart';
import 'package:my_app/categoryItem.dart';
import 'package:my_app/models/dataTest.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        padding: EdgeInsets.all(10),
        children: DataTest.map((e) => CategoryItem(e)).toList());
  }
}
