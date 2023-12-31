// ignore_for_file: unused_field

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:note_app/Screen/EmptyTask.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/data/task.dart';
import 'package:note_app/Screen/edit_task_screen.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  taskModel task;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxCheckd = false;
  double _opacity = 1;
  bool _shimmerEffect = false;

  @override
  void initState() {
    super.initState();
    isBoxCheckd = widget.task.isDone;
    _opacity = widget.task.opacity;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Center getTaskItem() {
    return Center(
        child: GestureDetector(
      onTap: () {
        _shimmerEffect = true;
        setState(() {
          isBoxCheckd = !isBoxCheckd;
          widget.task.isDone = isBoxCheckd;
          isBoxCheckd == true ? _opacity = .5 : _opacity = 1;
          widget.task.opacity = _opacity;
          widget.task.save();
        });
      },
      child: Animate(
        autoPlay: false,
        effects: [ShimmerEffect(duration: Duration(milliseconds: 400))],
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 300),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            width: 380,
            height: 132,
            decoration: ShapeDecoration(
              color: AdaptiveTheme.of(context).isDefault
                  ? Colors.white
                  : Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x05000000),
                  blurRadius: 0,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x05000000),
                  blurRadius: 23,
                  offset: Offset(0, 10),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x05000000),
                  blurRadius: 42,
                  offset: Offset(0, 42),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x02000000),
                  blurRadius: 56,
                  offset: Offset(0, 94),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x00000000),
                  blurRadius: 67,
                  offset: Offset(0, 167),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x00000000),
                  blurRadius: 73,
                  offset: Offset(0, 261),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: getMainContant(),
            ),
          ),
        ),
      ),
    ));
  }

  Row getMainContant() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(
                    scale: 1.26,
                    child: Checkbox(
                      activeColor: Color.fromARGB(255, 17, 171, 128),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      value: isBoxCheckd,
                      onChanged: (isChekd) {
                        setState(() {
                          isBoxCheckd == true
                              ? taskBox.length - 1
                              : taskBox.length;
                          isBoxCheckd = isChekd!;
                          widget.task.isDone = isBoxCheckd;
                          isBoxCheckd == true ? _opacity = .5 : _opacity = 1;
                          widget.task.opacity = _opacity;
                          widget.task.save();
                        });
                      },
                    ),
                  ),
                  Text(
                    widget.task.title,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.fade),
                  ),
                ],
              ),
              Text(widget.task.subTitle, overflow: TextOverflow.fade),
              Spacer(),
              getTimeAndEditBTN()
            ],
          ),
        ),
        const SizedBox(width: 15),
        Image.asset(widget.task.taskType.image),
        Animate(
          onPlay: (controller) => controller.repeat(reverse: true),
          effects: [
            ShimmerEffect(
                duration: Duration(seconds: 2), delay: Duration(seconds: 1))
          ],
          child: Container(
            width: 3,
            height: 90,
            decoration: BoxDecoration(
                color: isBoxCheckd == true ? green : Colors.blue,
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ],
    );
  }

  Row getTimeAndEditBTN() {
    return Row(
      children: [
        Container(
          width: 83,
          height: 28,
          decoration: const BoxDecoration(
            color: Color(0xFF18DAA3),
            borderRadius: BorderRadius.all(
              Radius.circular(13),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  '${widget.task.time.hour}:${getMintusTimeZero(widget.task.time)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    fontFamily: 'Shabnam',
                    // fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Image.asset('assets/images/Time.png'),
            ],
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => Animate(effects: [
                  MoveEffect(duration: Duration(milliseconds: 700))
                ], child: editTaskScreen(task: widget.task)),
              ),
            );
          },
          child: Container(
            width: 85,
            height: 28,
            decoration: const BoxDecoration(
              color: Color(0xFFE2F6F1),
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'ویرایش',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AdaptiveTheme.of(context).isDefault
                        ? Color(0xFF18DAA3)
                        : Color.fromARGB(255, 20, 137, 104),
                    fontSize: 13,
                    fontFamily: 'Shabnam',
                  ),
                ),
                Image.asset('assets/images/Edit.png'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String getMintusTimeZero(DateTime time) {
    if (time.minute < 10) {
      return '0${time.minute}';
    } else {
      return time.minute.toString();
    }
  }
}
