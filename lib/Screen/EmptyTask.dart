import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive/hive.dart';
import 'package:note_app/data/task.dart';

class EmptyTask extends StatefulWidget {
  const EmptyTask({super.key});

  @override
  State<EmptyTask> createState() => _EmptyTaskState();
}

var taskBox = Hive.box<taskModel>('taskBox');

class _EmptyTaskState extends State<EmptyTask> {
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFFAFAFA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Animate(
              effects: [
                FadeEffect(
                  duration: Duration(milliseconds: 1500),
                ),
              ],
              child: Image.asset('assets/images/NotFoundTask.png', height: 230),
            ),
            SizedBox(height: 10),
            Text('').animate(
              effects: [
                FadeEffect(
                  duration: Duration(milliseconds: 1500),
                ),
              ],
              autoPlay: true,
              onPlay: (controller) => controller.repeat(reverse: true),
            ).custom(
              duration: Duration(seconds: 1),
              builder: (context, value, child) => Text(
                ':) شما درحال حاضر تسکی برای انجام ندارید',
                style: TextStyle(
                  color: Color.lerp(Color.fromARGB(255, 229, 229, 229),
                      Color.fromARGB(255, 123, 123, 123), value),
                ),
              ),
            ),
            SizedBox(height: 75),
          ],
        ),
      ),
    );
  }
}
