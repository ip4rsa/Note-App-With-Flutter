import 'package:flutter/material.dart';
import 'package:note_app/data/task.dart';
import 'package:note_app/Screen/edit_task_screen.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  taskModel task;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxCheckd = false;

  @override
  void initState() {
    super.initState();
    isBoxCheckd = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Center getTaskItem() {
    return Center(
        child: GestureDetector(
      onTap: () {
        setState(() {
          isBoxCheckd = !isBoxCheckd;
          widget.task.isDone = isBoxCheckd;
          widget.task.save();
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        width: 380,
        height: 132,
        decoration: ShapeDecoration(
          color: Colors.white,
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
                  // MSHCheckbox(
                  //   size: 28,
                  //   value: isDone,
                  //   colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                  //     checkedColor: Color.fromARGB(255, 17, 171, 128),
                  //   ),
                  //   style: MSHCheckboxStyle.fillScaleCheck,
                  //   onChanged: (selected) {
                  //     setState(
                  //       () {
                  //         isDone = selected;
                  //       },
                  //     );
                  //   },
                  // ),
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
                        isBoxCheckd = isChekd!;
                      },
                    ),
                  ),
                  Text(
                    widget.task.title,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Text(widget.task.subTitle, overflow: TextOverflow.ellipsis),
              Spacer(),
              getTimeAndEditBTN()
            ],
          ),
        ),
        const SizedBox(width: 15),
        Image.asset(widget.task.taskType.image),
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
              Text(
                '${widget.task.time.hour}:${getMintusTimeZero(widget.task.time)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'Shabnam',
                  // fontWeight: FontWeight.w700,
                  height: 2.2,
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
              DialogRoute(
                context: context,
                builder: (context) => editTaskScreen(task: widget.task),
              ),
            );
          },
          child: Container(
            width: 87,
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
                const Text(
                  'ویرایش',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF18DAA3),
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
