import 'package:flutter/material.dart';

class NewNote extends StatefulWidget {
  final Function addNT;
  NewNote(this.addNT);
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  void _submitData() {
    final enteredTittle = titleController.text;

    final enteredNote = noteController.text;

    if (enteredNote.isEmpty || enteredTittle.isEmpty) {
      return;
    }
    widget.addNT(enteredTittle, enteredNote);
    Navigator.of(context).pop();
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
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Note'),
                controller: noteController,
                onSubmitted: (_) => _submitData(),
              ),
              RaisedButton(
                child: Text('Add Note'),
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
