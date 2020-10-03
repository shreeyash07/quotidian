import 'package:flutter/material.dart';
import 'package:quotidian/models/note.dart';
import 'package:quotidian/screens/homescreenUI/fragments/notes/Components/new_note.dart';

import '../../../../constants.dart';
import 'Components/notelist.dart';

class NoteMain extends StatefulWidget {
  @override
  _NoteMainState createState() => _NoteMainState();
}

class _NoteMainState extends State<NoteMain> {
  final List<Note> _note = [];

  List<Note> get _recentNote {
    return _note;
  }

  void _addNewNote(
    String title,
    String note,
  ) {
    final newNt = Note(
      id: DateTime.now().toString(),
      title: title,
      note: note,
    );
    setState(() {
      _note.add(newNt);
    });
  }

  void _deleteNote(String id) {
    setState(() {
      _note.removeWhere((nt) => nt.id == id);
    });
  }

  void _startAddNewNote(BuildContext ctx) {
    showModalBottomSheet(
      elevation: 100,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewNote(_addNewNote),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ntList = Container(
      height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: NoteList(_note, _deleteNote),
    );

    final pageBody = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ntList],
      ),
    );
    return Scaffold(
      body: pageBody,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _startAddNewNote(context),
        icon: Icon(Icons.add),
        backgroundColor: qPrimaryColor,
        label: Text('Add Note'),
        elevation: 6,
      ),
    );
  }
}
