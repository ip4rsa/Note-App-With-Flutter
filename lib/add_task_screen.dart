import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/model/task.dart';
import 'package:time_pickerr/time_pickerr.dart';
import 'package:toastification/toastification.dart';

class addTaskScreen extends StatefulWidget {
  const addTaskScreen({super.key});

  @override
  State<addTaskScreen> createState() => _addTaskScreenState();
}

DateTime? _time;
bool iosStyle = true;

class _addTaskScreenState extends State<addTaskScreen> {
  FocusNode neghban1 = FocusNode();
  FocusNode neghban2 = FocusNode();
  final TextEditingController controllerTaskTitle = TextEditingController();
  final TextEditingController controllerTaskSubTitle = TextEditingController();

  final box = Hive.box<taskModel>('TaskBox');

  @override
  void initState() {
    super.initState();
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
            SizedBox(height: 20),
            Image.asset('assets/images/addTaskk.png', height: 200),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: controllerTaskTitle,
                  focusNode: neghban1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(17),
                    labelText: ' عنوان تسک جدید ',
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
                    labelText: ' توضیحات تسک جدید ',
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
                title: 'انتخاب زمان تسک',
                titleStyle: TextStyle(color: green, fontSize: 17),
                negativeButtonText: 'حذف',
                negativeButtonStyle:
                    TextStyle(color: const Color.fromARGB(255, 184, 40, 30)),
                positiveButtonText: 'تایید زمان',
                positiveButtonStyle:
                    TextStyle(color: green, fontWeight: FontWeight.bold),
                onPositivePressed: (context, time) {
                  _time = time;
                  toastification.show(
                    context: context,
                    type: ToastificationType.success,
                    style: ToastificationStyle.flat,
                    title: 'زمان تسک تنظیم شد.',
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
                  String taskTitle = controllerTaskTitle.text;
                  String taskSubTitle = controllerTaskSubTitle.text;
                  addTask(
                    taskTitle,
                    taskSubTitle,
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  'اضافه کن',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  addTask(String taskTitle, String taskSubTitle) {
    var task = taskModel(
      title: taskTitle,
      subTitle: taskSubTitle,
      time: _time!,
    );
    box.add(task);
  }
}
