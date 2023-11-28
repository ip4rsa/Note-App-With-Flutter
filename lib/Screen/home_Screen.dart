import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/Screen/EmptyTask.dart';
import 'package:note_app/data/task.dart';
import 'package:note_app/widget/appBar_widget.dart';
import 'package:note_app/widget/task_widget.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

var _controller = TextEditingController();
final TextEditingController _nameController = TextEditingController();

class _homeScreenState extends State<homeScreen> {
  bool isChecked = false;
  var taskBox = Hive.box<taskModel>('taskBox');
  bool isFabVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: Animate(
          effects: [FadeEffect(duration: Duration(milliseconds: 400))],
          child: getAppBar(),
        ),
      ),
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
            child: taskBox.isEmpty
                ? EmptyTask()
                : Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: taskBox.values.length,
                      itemBuilder: (context, index) {
                        var task = taskBox.values.toList()[index];

                        return Animate(
                          effects: [
                            FadeEffect(duration: Duration(milliseconds: 1050))
                          ],
                          child: Dismissible(
                            movementDuration: Duration(seconds: 1),
                            direction: DismissDirection.endToStart,
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              setState(() {});
                              task.delete();
                            },
                            child: TaskWidget(task: task),
                          ),
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
