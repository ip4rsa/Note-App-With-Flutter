import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/model/task.dart';
import 'package:note_app/model/task_type_data.dart';
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
        child: SingleChildScrollView(
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(17)),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(17)),
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
              // Spacer(),
              getTaskTypeItems(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: .7,
                    minimumSize: Size(150, 50),
                    backgroundColor: green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
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
      height: 210,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: taskDataType.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedTaskTypeItem = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
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
                      child: Image.asset(taskDataType[index].image, scale: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(taskDataType[index].title),
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
}
