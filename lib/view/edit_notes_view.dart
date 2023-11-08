import 'package:flutter/material.dart';
import 'package:notes_app/helper/sqlhelper.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/view/home_view.dart';

class EditNote extends StatefulWidget {
  final int NoteId;

  const EditNote({required this.NoteId});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadNoteData();
  }

  void _loadNoteData() async {
    final noteData = await SQLHelper.getItems(widget.NoteId);
    if (noteData.isNotEmpty) {
      final firstNote = noteData[0];
      setState(() {
        _titleController.text = firstNote['title'];
        _descriptionController.text = firstNote['description'];
      });
    }
  }


  void _updateNode() async {
    final title = _titleController.text;
    final description = _descriptionController.text;

    if(title.isNotEmpty && description.isNotEmpty){
      await SQLHelper.updateItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none, labelText: 'Title'),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none, labelText: 'Description'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: const Text("Alert"),
                                content:
                                    const Text("Are you sure you want to submit?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => HomePage()));
                                      },
                                      child: Container(
                                        color: Colors.green,
                                        padding: const EdgeInsets.all(10.0),
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Container(
                                        color: Colors.green,
                                        padding: const EdgeInsets.all(10.0),
                                        child: const Text(
                                          'No',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ))
                                ],
                              ));
                    },
                    child: const Text('Edit')),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Alert"),
                            content:
                            const Text("Are you sure you want to delete?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  },
                                  child: Container(
                                    color: Colors.green,
                                    padding: const EdgeInsets.all(10.0),
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    color: Colors.green,
                                    padding: const EdgeInsets.all(10.0),
                                    child: const Text(
                                      'No',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))
                            ],
                          ));
                    },
                    child: const Text('Delete')),
              ],
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (ctx) => AlertDialog(
            //             title: const Text("Alert"),
            //             content:
            //             const Text("Are you sure you want to delete?"),
            //             actions: [
            //               TextButton(
            //                   onPressed: () {
            //                     Navigator.of(context).push(
            //                         MaterialPageRoute(
            //                             builder: (context) => HomePage()));
            //                   },
            //                   child: Container(
            //                     color: Colors.green,
            //                     padding: const EdgeInsets.all(10.0),
            //                     child: const Text(
            //                       'Yes',
            //                       style: TextStyle(color: Colors.white),
            //                     ),
            //                   )),
            //               TextButton(
            //                   onPressed: () {
            //                     Navigator.of(ctx).pop();
            //                   },
            //                   child: Container(
            //                     color: Colors.green,
            //                     padding: const EdgeInsets.all(10.0),
            //                     child: const Text(
            //                       'No',
            //                       style: TextStyle(color: Colors.white),
            //                     ),
            //                   ))
            //             ],
            //           ));
            //     },
            //     child: const Text('Delete')),
          ],
        ),
      ),
    );
  }
}
