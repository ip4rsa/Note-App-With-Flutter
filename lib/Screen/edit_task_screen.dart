import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/data/task.dart';
import 'package:note_app/data/task_type_data.dart';
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
  int selectedTaskTypeItem = 0;

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

    var index = taskDataType.indexWhere((element) {
      return element.taskTypeEnum == widget.task.taskType.taskTypeEnum;
    });
    selectedTaskTypeItem = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 1200,
          child: Column(
            children: [
              Image.asset('assets/images/editTask.png', height: 200),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
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
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: gray),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: green),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllerTaskSubTitle,
                    maxLines: 1,
                    focusNode: neghban2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(17),
                      labelText: ' توضیحات جدید ',
                      labelStyle: TextStyle(
                          color: neghban1.hasFocus ? green : gray,
                          fontFamily: 'Shabnam'),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: gray),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: green),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Container(
                        width: 13,
                        height: 2,
                        color: green,
                      ),
                      SizedBox(width: 6),
                      Text('انتخاب دسته بندی :', textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              getTaskTipeitesm(),
              SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Container(
                        width: 13,
                        height: 2,
                        color: green,
                      ),
                      SizedBox(width: 6),
                      Text('انتخاب زمان جدید تسک :',
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              CustomHourPicker(
                elevation: 2,
                title: '',
                titleStyle: TextStyle(color: green, fontSize: 17),
                negativeButtonText: '',
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
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Divider(
                  color: Color.fromARGB(68, 158, 158, 158),
                  height: 40,
                  indent: 30,
                  endIndent: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: .2,
                        minimumSize: Size(100, 50),
                        backgroundColor: Color.fromARGB(255, 199, 78, 69),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'بازگشت',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container getTaskTipeitesm() {
    return Container(
      height: 180,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: taskDataType.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: taskDataType.first == taskDataType[index]
                ? EdgeInsets.only(left: 55, right: 8)
                : EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedTaskTypeItem = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedTaskTypeItem == index
                      ? green
                      : Colors.transparent,
                  border: Border.all(
                      width: 2.3,
                      color: selectedTaskTypeItem == index
                          ? green
                          : Color.fromARGB(78, 140, 140, 140)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(taskDataType[index].image, scale: 9),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(taskDataType[index].title,
                          style: TextStyle(
                              fontSize: 16,
                              color: selectedTaskTypeItem == index
                                  ? Colors.white
                                  : Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  editTAsk(String taskTitle, String taskSubTitle) {
    widget.task.title = taskTitle;
    widget.task.subTitle = taskSubTitle;
    widget.task.time = _time!;
    widget.task.taskType = taskDataType[selectedTaskTypeItem];
    widget.task.save();
  }
}
