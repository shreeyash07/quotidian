import 'package:flutter/material.dart';
import 'package:quotidian/constants.dart';
import 'package:quotidian/models/note.dart';

class NoteList extends StatelessWidget {
  final List<Note> note;
  final Function deleteNT;

  NoteList(this.note, this.deleteNT);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return note.isEmpty
        ? LayoutBuilder(builder: (ctx, contraints) {
            return Column(
              children: [
                Text(
                  "No Note",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 10),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: EdgeInsets.all(10),
                elevation: 6,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(padding: EdgeInsets.all(10)),
                    backgroundColor: qPrimaryColor,
                  ),
                  title: Text(
                    note[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    note[index].note,
                    style: Theme.of(context).textTheme.title,
                  ),
                  trailing: mediaQuery.size.width > 460
                      ? FlatButton.icon(
                          onPressed: () => deleteNT(note[index].id),
                          icon: Icon(Icons.delete),
                          textColor: Theme.of(context).errorColor,
                          label: Text('Delete'),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteNT(note[index].id),
                        ),
                ),
              );
            },
            itemCount: note.length,
          );
  }
}
