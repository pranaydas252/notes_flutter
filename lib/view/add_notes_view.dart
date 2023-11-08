import 'package:flutter/material.dart';
import 'package:notes_app/helper/sqlhelper.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/view/home_view.dart';

class NewNotes extends StatefulWidget {
  final void Function() onDataAdded;


  const NewNotes({super.key, required this.onDataAdded});

  @override
  State<NewNotes> createState() => _NewNotesState();
}

class _NewNotesState extends State<NewNotes> {
  final TextEditingController _titleController = TextEditingController();
  final  TextEditingController _descriptionController = TextEditingController();

  Future<void> _addItem() async {
    final title = _titleController.text;
    final description = _descriptionController.text;

    if (title.isNotEmpty && description.isNotEmpty) {
      await SQLHelper.createItem(
          _titleController.text, _descriptionController.text);
      widget.onDataAdded();
      Navigator.of(context).pop();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notes'),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          children: [
            TextField(
              controller : _titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
              ),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Description',
                  ),
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await _addItem();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
          },
          label: const Text("Save Note")
      ),
    );
  }
}
