// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/constants/dividers.dart';
import 'package:note_app/data/task.dart';
import 'package:hive/hive.dart';
import 'package:note_app/widget/appBar_widget.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key, this.task});
  taskModel? task;
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

FocusNode neghban1 = FocusNode();
FocusNode neghban2 = FocusNode();
final TextEditingController userNameController = TextEditingController();
final box = Hive.box<taskModel>('TaskBox');
bool _onChange = false;

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Column(
        children: [
          SizedBox(height: 60),
          getSettingSection1(),
          SizedBox(height: 20),
          getSettingSection2(),
        ],
      ),
    );
  }

  Center getSettingSection1() {
    return Center(
      child: Container(
        width: 332,
        height: 80,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          shadows: [
            BoxShadow(
              color: Color.fromARGB(16, 0, 0, 0),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Row(
            children: [
              Transform.scale(
                scale: .85,
                child: CupertinoSwitch(
                  value: _onChange,
                  onChanged: (value) {
                    setState(() {
                      _onChange == false ? _onChange = true : _onChange = false;
                    });
                  },
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Text(
                  'حالت شب',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                width: 26,
                height: 26,
                decoration: ShapeDecoration(
                  color: Color(0xFF745CF1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Icon(
                  CupertinoIcons.moon_stars,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class getSettingSection2 extends StatelessWidget {
  const getSettingSection2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 332,
        height: 270,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          shadows: [
            BoxShadow(
              color: Color.fromARGB(16, 0, 0, 0),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: false,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 3,
                            sigmaY: 3,
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 255, 255, 0.5),
                                  Color.fromRGBO(255, 255, 255, 0.573),
                                ],
                              ),
                            ),
                            height: 350,
                            child: getChengeUserName(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.left_chevron,
                      color: const Color(0xffAEAEAEB2),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Text(
                        'نام کاربری',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      width: 26,
                      height: 26,
                      decoration: ShapeDecoration(
                        color: Color(0xFF5CCBF1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Icon(
                        CupertinoIcons.pencil,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
              DividerSetting,
              Row(
                children: [
                  Icon(
                    CupertinoIcons.left_chevron,
                    color: const Color(0xffAEAEAEB2),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Text(
                      'درباره ما',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    width: 26,
                    height: 26,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF18A5C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Icon(
                      CupertinoIcons.question,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
              DividerSetting,
              Row(
                children: [
                  Icon(
                    CupertinoIcons.left_chevron,
                    color: const Color(0xffAEAEAEB2),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Text(
                      'امتیاز به تسکیار',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    width: 26,
                    height: 26,
                    decoration: ShapeDecoration(
                      color: Color(0xFF5CF198),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Icon(
                      CupertinoIcons.star,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class getChengeUserName extends StatelessWidget {
  getChengeUserName({super.key, this.task});
  taskModel? task;
  var text = userNameController.text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'تغییر نام کاربری',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                borderRadius: BorderRadius.all(
                  Radius.circular(13),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.pencil, color: Colors.white),
                    SizedBox(width: 7),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: TextField(
                          controller: userNameController,
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'نام کاربری جدید',
                            helperStyle: TextStyle(fontFamily: 'GB'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        // Spacer(),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            getAppBar(
              receivedValue: userNameController.text,
            );
            // text = task!.userName;
            // print(task?.userName ?? 'ddddddddd');
            String username = userNameController.text;
            addUserName(username);
          },
          child: Text('ذخیره'),
        ),
      ],
    );
  }

  addUserName(String uuserName) {
    // var user = taskModel(userName: uuserName);
    // box.add(user);

    // print(task?.userName);
  }
}
