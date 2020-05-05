
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({Key key}) : super(key: key);
  final Function addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime _selectedDate;

  void submitData() {
    final eneteredTittle = titleController.text;
    final eneteredAmount = double.parse(amountController.text);π
    
    if (eneteredTittle.isEmpty || eneteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTransactionHandler(eneteredTittle, eneteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDataPicker() {
    var dateFuture = showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now());
    dateFuture.then((pickedDate) {
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
    return SingleChildScrollView(
          child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text(_selectedDate == null ? "No date" : DateFormat.yMMMd().format(_selectedDate))),
                    Platform.isIos FlatButton(
                      onPressed: _presentDataPicker,
                      child: Text(
                        'Chosse date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () => submitData(),
                child: Text(
                  'Add Trasaction',
                ),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
