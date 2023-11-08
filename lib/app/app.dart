import 'package:flutter/material.dart';
import 'package:notes_app/view/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Notes",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
