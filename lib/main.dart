import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/home_Screen.dart';
import 'package:note_app/model/task.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(taskModelAdapter());
  await Hive.openBox<taskModel>('TaskBox');

  runApp(NoteApp());
}

class NoteApp extends StatefulWidget {
  const NoteApp({super.key});

  @override
  State<NoteApp> createState() => _NoteAppState();
}

var _controller = TextEditingController();

@override
class _NoteAppState extends State<NoteApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Shabnam',
        useMaterial3: true,
      ),
      home: homeScreen(),
    );
  }
}
