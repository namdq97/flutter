import 'package:flutter/material.dart';
import 'package:my_app/transaction.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TransactionList extends StatelessWidget {
  List<Transaction> trannsaction = [];

  TransactionList(this.trannsaction);

  List<Widget> _buildWidgetlist() {
    int index = 0;
    return trannsaction.map((e) {
      index++;
      return Container(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: index % 2 == 0 ? Colors.pink : Colors.lightBlue,
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text('Amount: ${e.amount}'),
                  Text('Price: ${e.price} \$'),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              Expanded(
                  child: Row(
                children: [
                  Container(
                    child: Text(
                        'Time: ${DateFormat.yMMMMEEEEd().format(e.createAt)}'),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    padding: EdgeInsets.all(5),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10)),
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ))
            ],
          ),
        ),
      );
      // child: ListTile(
      //   title: Text('Amount ${e.amount}'),
      //   subtitle: Text('Content ${e.price}'),
      //   leading: Icon(Icons.access_alarms),
      //   onTap: () {
      //     print('test');
      //   },
      // ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return Column(children: _buildWidgetlist());
    return Container(
      height: 500,
      child: ListView(
        children: _buildWidgetlist(),
      ),
    );
  }
}
