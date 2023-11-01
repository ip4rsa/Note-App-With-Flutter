import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/model/task.dart';
import 'package:time_pickerr/time_pickerr.dart';
import 'package:toastification/toastification.dart';

class editTaskScreen extends StatefulWidget {
  editTaskScreen({super.key, required this.task});
  taskModel task;

  @override
  State<editTaskScreen> createState() => _editTaskScreenState();
}

class _editTaskScreenState extends State<editTaskScreen> {
  FocusNode neghban1 = FocusNode();
  FocusNode neghban2 = FocusNode();
  TextEditingController? controllerTaskTitle;
  TextEditingController? controllerTaskSubTitle;
  DateTime? _time;

  final box = Hive.box<taskModel>('TaskBox');

  @override
  void initState() {
    super.initState();
    controllerTaskTitle = TextEditingController(text: widget.task.title);
    controllerTaskSubTitle = TextEditingController(text: widget.task.subTitle);
    neghban1.addListener(() {
      setState(() {});
    });
    neghban2.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        child: Column(
          children: [
            Image.asset('assets/images/editTask.png', height: 200),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: controllerTaskTitle,
                  focusNode: neghban1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(17),
                    labelText: ' عنوان جدید ',
                    labelStyle: TextStyle(
                        color: neghban1.hasFocus ? green : gray,
                        fontFamily: 'Shabnam'),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(17),
                      ),
                      borderSide: BorderSide(width: 2, color: gray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(17)),
                      borderSide: BorderSide(width: 2, color: green),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: controllerTaskSubTitle,
                  maxLines: 2,
                  focusNode: neghban2,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(17),
                    labelText: ' توضیحات جدید ',
                    labelStyle: TextStyle(
                        color: neghban2.hasFocus ? green : gray,
                        fontFamily: 'Shabnam'),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(17),
                      ),
                      borderSide: BorderSide(width: 2, color: gray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(17)),
                      borderSide: BorderSide(width: 2, color: green),
                    ),
                  ),
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: CustomHourPicker(
                elevation: 2,
                title: 'انتخاب زمان جدید تسک',
                titleStyle: TextStyle(color: green, fontSize: 17),
                negativeButtonText: 'حذف',
                negativeButtonStyle:
                    TextStyle(color: const Color.fromARGB(255, 184, 40, 30)),
                positiveButtonText: 'تایید زمان جدید',
                positiveButtonStyle:
                    TextStyle(color: green, fontWeight: FontWeight.bold),
                onPositivePressed: (context, time) {
                  _time = time;
                  toastification.show(
                    context: context,
                    type: ToastificationType.success,
                    style: ToastificationStyle.flat,
                    title: 'زمان جدید تسک تنظیم شد.',
                    alignment: Alignment.topCenter,
                    autoCloseDuration: const Duration(seconds: 2),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: highModeShadow,
                    direction: TextDirection.rtl,
                    dragToClose: true,
                    showProgressBar: false,
                    closeButtonShowType: CloseButtonShowType.onHover,
                  );
                },
                onNegativePressed: (context) {
                  print('onNegative');
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: .7,
                    minimumSize: Size(150, 50),
                    backgroundColor: green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14))),
                onPressed: () {
                  String taskTitle = controllerTaskTitle!.text;
                  String taskSubTitle = controllerTaskSubTitle!.text;
                  editTAsk(taskTitle, taskSubTitle);
                  Navigator.pop(context);
                },
                child: Text(
                  'ویرایش کن',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  editTAsk(String taskTitle, String taskSubTitle) {
    widget.task.title = taskTitle;
    widget.task.subTitle = taskSubTitle;
    widget.task.time = _time!;
    widget.task.save();
  }
}
