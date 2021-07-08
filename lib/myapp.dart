import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'transaction.dart';
import 'transList.dart';

class MyApp extends StatefulWidget {
  String name = '';
  int age = 0;

  MyApp(this.name, this.age);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String _email = '';
  int _price = 0;
  int _amount = 0;
  int total = 0;
  final emailHandle = TextEditingController();
  final _in = TextEditingController();
  final _input1Controller = TextEditingController();
  final _input2Controller = TextEditingController();
  var now = DateFormat.yMMMMEEEEd().format(new DateTime.now());

  Transaction _transaction = Transaction(0, 0, DateTime.now());

  List<Transaction> _transactions = <Transaction>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    print('init app');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    print('close app');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print('app in background mode');
    } else if (state == AppLifecycleState.resumed) {
      print('app in foreground mode');
    }
  }

  void _inserTrasn() {
    print(_transactions);
    this.setState(() {
      // total = _amount * _price;
      if (_transaction.amount > 0 && _transaction.price > 0) {
        _transactions.add(_transaction);
      }
      // _transaction.price = 0;
      // _transaction.amount = 0;
      _transaction = Transaction(0, 0, DateTime.now());
      _input2Controller.text = '';
      _input1Controller.text = '';
    });
    Navigator.pop(context);
  }

  void _onShowModal() {
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'amount'),
                  controller: _input2Controller,
                  onChanged: (text) {
                    this.setState(() {
                      // _amount = int.parse(text) ?? 0;
                      _transaction.amount = int.parse(text) ?? 0;
                    });
                    print(_transaction.amount);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'price'),
                  controller: _input1Controller,
                  onChanged: (text) {
                    this.setState(() {
                      // _price = int.parse(text) ?? 0;
                      print('text ${text}');
                      _transaction.price = int.parse(text) ?? 0;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: ButtonTheme(
                        height: 60,
                        child: TextButton(
                          onPressed: () {
                            this._inserTrasn();
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                  TextStyle(color: Colors.white))),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ButtonTheme(
                        height: 60,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.redAccent),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                  TextStyle(color: Colors.white))),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Title Screen'),
            actions: [
              IconButton(
                  onPressed: () {
                    print('123');
                  },
                  icon: Icon(Icons.ad_units))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'add',
            child: Icon(Icons.add),
            onPressed: () {
              this._onShowModal();
            },
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: SafeArea(
              minimum: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Text('amount = ${this._amount}',style: TextStyle(fontSize: 30)),
                  // Text('price = ${this._price}', style: TextStyle(fontSize: 30)),
                  // Text('total = ${this.total}', style: TextStyle(fontSize: 30)),
                  // Text('result = ${this._transactions.toString()}',
                  //     style: TextStyle(fontSize: 30)),
                  // Text('age = ${widget.age}', style: TextStyle(fontSize: 30)),
                  // Text('email = ${this._email}',
                  //     style: TextStyle(fontSize: 30)),
                  // Text('time = ${this.now}', style: TextStyle(fontSize: 30)),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  //   child: TextField(
                  //     controller: emailHandle,
                  //     onChanged: (text) {
                  //       this.setState(() {
                  //         _email = text;
                  //       });
                  //     },
                  //     decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //             borderRadius: const BorderRadius.all(
                  //                 const Radius.circular(30))),
                  //         labelText: 'enter email'),
                  //   ),

                  // ),

                  Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                  ButtonTheme(
                    height: 60,
                    child: TextButton(
                      onPressed: () {
                        this._onShowModal();
                        // this._inserTrasn();
                        // showDialog<String>(
                        //   context: context,
                        //   builder: (BuildContext context) => AlertDialog(
                        //     title: Text('AlertDialog Title'),
                        //     content: Text(
                        //         'amount = ${_transaction.amount} && price = ${_transaction.price} '),
                        //     actions: <Widget>[
                        //       TextButton(
                        //         onPressed: () => Navigator.pop(context, 'Cancel'),
                        //         child: const Text('Cancel'),
                        //       ),
                        //       TextButton(
                        //         onPressed: () => Navigator.pop(context, 'OK'),
                        //         child: const Text('OK'),
                        //       ),
                        //     ],
                        //   ),
                        // );
                      },
                      child: Text(
                        'Open Modal',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Roboto'),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.redAccent),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(color: Colors.white))),
                    ),
                  ),
                  TransactionList(_transactions)
                ],
              )))),
    );
  }
}
