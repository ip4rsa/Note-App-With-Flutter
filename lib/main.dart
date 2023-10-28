import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/car.dart';
import 'package:note_app/home_Screen.dart';
import 'package:note_app/student.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('Names');
  // await Hive.openBox<car>('CarBox');
  // Hive.registerAdapter(carAdapter());
  await Hive.openBox<student>('StudentBox');
  Hive.registerAdapter(StudentAdapter());

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
        useMaterial3: true,
      ),
      home: homeScreen(),
    );
  }
}
