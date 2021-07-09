import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/datePicker.dart';
import 'package:my_app/foodScreen.dart';
import 'package:my_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  late Category category;
  CategoryItem(this.category);
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Column(
    //     children: [
    //       Text(
    //         this.category.content,
    //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //       )
    //     ],
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //   ),
    //   decoration: BoxDecoration(
    //       color: this.category.color,
    //       borderRadius: BorderRadius.circular(20),
    //       gradient: LinearGradient(colors: [
    //         this.category.color.withOpacity(0.6),
    //         this.category.color
    //       ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
    // );
    return InkWell(
      child: Container(
        child: Column(
          children: [
            Text(
              this.category.content,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        decoration: BoxDecoration(
            color: this.category.color,
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              this.category.color.withOpacity(0.6),
              this.category.color
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
      ),
      onTap: () {
        print(this.category.content);

        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => TimePickerInPage()));

        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => FoodScreen(this.category, 0)));

        // Navigator.pushNamed(context, '/foodScreen',
        //     arguments: {'category', this.category});
      },
      splashColor: Colors.amberAccent,
    );
  }
}
