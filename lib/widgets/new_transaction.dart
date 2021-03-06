import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quotidian/models/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addTX;

  NewTransaction(this.addTX);
  //NewTransaction({Key key, }) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

Future<Transcations> addTransacrion(String title, String amount) async {
  final http.Response response = await http.post(
    "http://54.89.116.234/api/users/transaction",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "amount": amount,
      "title": title,
    }),
  );

  if (response.statusCode == 200) {
    print("transaction succesful");
    print(response.statusCode);
    print(response.body);

    return Transcations.fromJson(json.decode(response.body));
  } else {
    print("transaction unsusccess");
    print(response.statusCode);
    print(response.body);
    //throw Exception('Failed to add Trasaction.');
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  Transcations _tx;

  DateTime _selectedDate;

  void _submitData() {
    final enteredTittle = titleController.text;

    final enteredAmount = double.parse(amountController.text);

    if (enteredAmount <= 0 || enteredTittle.isEmpty || _selectedDate == null) {
      return;
    }
    widget.addTX(enteredTittle, enteredAmount, _selectedDate);
    _sync();

    Navigator.of(context).pop();
  }

  Future _sync() async {
    final String title = titleController.text;
    final String amount = amountController.text;
    final Transcations tx = await addTransacrion(title, amount);

    setState(() {
      _tx = tx;
    });
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: mediaQuery.viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => _submitData(),
                //onChanged: (val){
                //titleInput = val;
                //},
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                //onChanged: (val)=> amountInput=val,
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Choosen!'
                          : 'Picked Date:${DateFormat.yMd().format(_selectedDate)}'),
                    ),
                    Platform.isIOS
                        ? CupertinoButton(
                            child: Text(
                              'Choose Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: _presentDatePicker,
                          )
                        : FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            child: Text(
                              'Choose Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: _presentDatePicker,
                          )
                  ],
                ),
              ),
              Platform.isIOS
                  ? CupertinoButton(
                      child: Text('Add Transaction'),
                      color: Theme.of(context).primaryColor,
                      onPressed: _submitData,
                    )
                  : RaisedButton(
                      child: Text('Add Transaction'),
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).buttonColor,
                      onPressed: _submitData,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
