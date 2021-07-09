import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class DatePickerScrool extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<DatePickerScrool> {
  late DatePickerController _controller;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _controller = DatePickerController(
        initialDateTime: DateTime.now(), minYear: 2011, maxYear: 2050);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Scroll Date Picker Example"),
              centerTitle: true,
            ),
            body: Container(
                child: Center(
              child: ButtonTheme(
                child: TextButton(
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: ScrollDatePicker(
                          controller: _controller,
                          locale: DatePickerLocale.en_us,
                          pickerDecoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blueAccent, width: 2.0),
                            // color: Colors.amber
                          ),
                          config: DatePickerConfig(
                              isLoop: true,
                              selectedTextStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 17.0)),
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              _selectedDate = value;
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Open Modal',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Roboto'),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.redAccent),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(color: Colors.white))),
                ),
              ),
            ))
            // ScrollDatePicker(
            //   controller: _controller,
            //   locale: DatePickerLocale.en_us,
            //   pickerDecoration: BoxDecoration(
            //     border: Border.all(color: Colors.blueAccent, width: 2.0),
            //     // color: Colors.amber
            //   ),
            //   config: DatePickerConfig(
            //       isLoop: true,
            //       selectedTextStyle: TextStyle(
            //           fontWeight: FontWeight.w600,
            //           color: Colors.black,
            //           fontSize: 17.0)),
            //   onChanged: (value) {
            //     setState(() {
            //       _selectedDate = value;
            //     });
            //   },
            // ),
            ));
  }
}
