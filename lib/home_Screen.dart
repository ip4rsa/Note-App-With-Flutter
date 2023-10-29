import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/model/task.dart';
import 'package:note_app/task_widget.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

String _text = '';
var _controller = TextEditingController();

class _homeScreenState extends State<homeScreen> {
  bool isChecked = false;
  var taskBox = Hive.box<taskModel>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: ListView.builder(
          itemCount: taskBox.values.length,
          itemBuilder: (context, index) {
            var task = taskBox.values.toList()[index];
            return TaskWidget(task: task);
          },
        ),
      ),
    );
  }
}
