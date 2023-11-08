import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app/helper/sqlhelper.dart';
import 'package:notes_app/view/add_notes_view.dart';
import 'package:notes_app/view/edit_notes_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _notes = [];

  bool _isloading = true;

  void _refreshnotes() async {
    final data = await SQLHelper.getItem();
    setState(() {
      _notes = data;
      _isloading = false;
    });
  }

  void _addDataCallback() {
    _refreshnotes();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshnotes();
    print("...number of notes : ${_notes.length}");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Notes')),
        ),
        body: GridView.builder(
            itemCount: _notes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final note = _notes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditNote(NoteId: note['id'],)),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.only(
                    top: 10.0,
                    left: 15.0,
                    right: 15.0,
                  ),
                  elevation: 3.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          note['title'],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(note['description']),
                      )
                    ],
                  ),
                ),
              );
            }),
        // body: GridView.count(
        //   crossAxisCount: 2,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: GestureDetector(
        //         onTap: () {
        //           Navigator.of(context).push(
        //               MaterialPageRoute(builder: (context) => const EditNote()));
        //         },
        //         child: const Text(
        //           'Text1',
        //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: GestureDetector(
        //         onTap: () {
        //           Navigator.of(context).push(
        //               MaterialPageRoute(builder: (context) => const EditNote()));
        //         },
        //         child: Container(
        //           color: Colors.red,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewNotes(
                  onDataAdded: _addDataCallback,
                ),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }
}
