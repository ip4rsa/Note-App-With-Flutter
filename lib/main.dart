import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/Screen/main_Screen.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/data/task.dart';
import 'package:note_app/data/taskType_Enum.dart';
import 'package:note_app/data/task_taype_model.dart';
import 'package:note_app/Screen/home_Screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(taskModelAdapter());
  Hive.registerAdapter(taskTypeEnumAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
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
        primaryColor: green,
        fontFamily: 'Shabnam',
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
