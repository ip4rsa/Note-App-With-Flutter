import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/data/task.dart';
import 'package:note_app/data/task_type_data.dart';
import 'package:time_pickerr/time_pickerr.dart';
import 'package:toastification/toastification.dart';

class addTaskScreen extends StatefulWidget {
  const addTaskScreen({super.key});

  @override
  State<addTaskScreen> createState() => _addTaskScreenState();
}

DateTime? _time;
bool iosStyle = true;
int selectedIndex = 0;
int selectedTaskTypeItem = 0;
double _opacity = 1;

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
      backgroundColor: const Color(0xFFFAFAFA),
      body: ClipRRect(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Image.asset('assets/images/addTaskk.png', height: 200),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllerTaskTitle,
                    focusNode: neghban1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(17),
                      labelText: ' عنوان تسک ',
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
              SizedBox(height: 15),
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
                      labelText: ' توضیحات تسک ',
                      labelStyle: TextStyle(
                          color: neghban2.hasFocus ? green : gray,
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
              getTaskTypeItems(),
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
                      Text('انتخاب زمان تسک :', textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomHourPicker(
                  elevation: 1,
                  title: '',
                  titleStyle: TextStyle(color: green, fontSize: 17),
                  negativeButtonText: '',
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
                  onNegativePressed: (context) {},
                ),
              ),
              // Spacer(),
              // getTaskTypeItems(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Divider(
                  color: Color.fromARGB(68, 158, 158, 158),
                  height: 40,
                  indent: 55,
                  endIndent: 55,
                ),
              ),

              Animate(
                onPlay: (controller) => controller.repeat(reverse: true),
                effects: [
                  ElevationEffect(
                      duration: Duration(seconds: 2),
                      begin: 10,
                      end: 20,
                      color: Color.fromARGB(77, 0, 0, 0),
                      borderRadius: BorderRadius.circular(30))
                ],
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                      minimumSize: Size(150, 50),
                      backgroundColor: green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      String taskTitle = controllerTaskTitle.text;
                      String taskSubTitle = controllerTaskSubTitle.text;
                      addTask(
                        taskTitle,
                        taskSubTitle,
                      );
                      toastification.show(
                        context: context,
                        type: ToastificationType.success,
                        style: ToastificationStyle.flat,
                        title: 'تسک جدید شما با موفقیت اضافه شد.',
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'اضافه کن',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.ads_click_outlined, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 110),
            ],
          ),
        ),
      ),
    );
  }

  addTask(String taskTitle, String taskSubTitle) {
    var task = taskModel(
      title: taskTitle,
      subTitle: taskSubTitle,
      time: _time!,
      taskType: taskDataType[selectedTaskTypeItem],
      opacity: _opacity,
      userName: 'P',
    );
    box.add(task);
  }
}

class getTaskTypeItems extends StatefulWidget {
  const getTaskTypeItems({
    super.key,
  });

  @override
  State<getTaskTypeItems> createState() => _getTaskTypeItemsState();
}

class _getTaskTypeItemsState extends State<getTaskTypeItems> {
  @override
  Widget build(BuildContext context) {
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
                width: 130,
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
                      child: Image.asset(taskDataType[index].image, scale: 1),
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

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
