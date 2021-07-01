import 'package:flutter/material.dart';

class Transaction {
  int price = 0;
  int amount = 0;
  DateTime createAt;

  Transaction(this.amount, this.price, this.createAt);

  @override
  String toString() {
    // TODO: implement toString
    return 'amount = $amount and price=$price';
  }
}
