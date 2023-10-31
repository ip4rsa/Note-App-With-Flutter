import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/add_task_screen.dart';
import 'package:note_app/constants/colors.dart';
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
  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: ValueListenableBuilder(
          valueListenable: taskBox.listenable(),
          builder: (context, value, child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                setState(
                  () {
                    if (notification.direction == ScrollDirection.forward) {
                      isFabVisible = true;
                    }
                    if (notification.direction == ScrollDirection.reverse) {
                      isFabVisible = false;
                    }
                  },
                );
                return true;
              },
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: taskBox.values.length,
                itemBuilder: (context, index) {
                  var task = taskBox.values.toList()[index];
                  return Dismissible(
                    movementDuration: Duration(seconds: 2),
                    direction: DismissDirection.endToStart,
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      task.delete();
                    },
                    child: TaskWidget(task: task),
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: Visibility(
          visible: isFabVisible,
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 19, 177, 132),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => addTaskScreen(),
                  ));
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
