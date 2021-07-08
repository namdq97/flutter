import 'package:flutter/material.dart';
import 'package:my_app/categoryScreen.dart';
import 'myapp.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp('nam', 10),
//     theme: ThemeData(primaryColor: Colors.red),
//   ));
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: CategoryScreen(),
        appBar: AppBar(
          title: Text('Food category'),
          backgroundColor: Colors.pinkAccent,
        ),
      ),
      theme: ThemeData(primaryColor: Colors.red),
      title: 'food app',
    );
  }
}
