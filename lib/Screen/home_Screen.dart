import 'package:flutter/material.dart';
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
            child: taskBox.isEmpty
                ? EmptyTask()
                : Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: taskBox.values.length,
                      itemBuilder: (context, index) {
                        var task = taskBox.values.toList()[index];

                        return Animate(
                          effects: [
                            FadeEffect(duration: Duration(milliseconds: 1000))
                          ],
                          child: Dismissible(
                            behavior: HitTestBehavior.translucent,
                            resizeDuration: Duration(seconds: 1),
                            background: getBackDismissible(),
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

  Row getBackDismissible() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 120,
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 255, 81, 81),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x05FC5252),
                    blurRadius: 0,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x05FC5252),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x05FC5252),
                    blurRadius: 8,
                    offset: Offset(0, 8),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x02FC5252),
                    blurRadius: 11,
                    offset: Offset(0, 19),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x00FC5252),
                    blurRadius: 13,
                    offset: Offset(0, 33),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x00FC5252),
                    blurRadius: 15,
                    offset: Offset(0, 52),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('حذف و پایان',
                      style:
                          TextStyle(color: Color.fromARGB(226, 255, 255, 255))),
                  SizedBox(width: 10),
                  Image.asset('assets/images/Delete (1).png', height: 23),
                  SizedBox(width: 30),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
