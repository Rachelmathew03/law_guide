import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookmarkNotesPage extends StatefulWidget {
  @override
  _BookmarkNotesPageState createState() => _BookmarkNotesPageState();
}

class _BookmarkNotesPageState extends State<BookmarkNotesPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  void _saveNote() {
    if (_user == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please log in to save notes")));
      return;
    }

    _firestore.collection("users").doc(_user!.uid).collection("notes").add({
      "note": _noteController.text,
      "timestamp": FieldValue.serverTimestamp(),
    });

    _noteController.clear();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Note saved!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _noteController,
              decoration: InputDecoration(labelText: "Write a note", border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _saveNote, child: Text("Save Note")),
            SizedBox(height: 20),
            Expanded(
              child: _user == null
                  ? Center(child: Text("Please log in to view your notes"))
                  : StreamBuilder(
                      stream: _firestore.collection("users").doc(_user!.uid).collection("notes").orderBy("timestamp", descending: true).snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return CircularProgressIndicator();
                        var notes = snapshot.data!.docs;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            var note = notes[index];
                            return ListTile(
                              title: Text(note["note"]),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  note.reference.delete();
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}