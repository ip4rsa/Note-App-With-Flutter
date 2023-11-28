// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/Screen/main_Screen.dart';
import 'package:note_app/constants/notifShow.dart';
import 'package:note_app/data/task.dart';
import 'package:note_app/main.dart';
import 'package:toastification/toastification.dart';

class SelectedNameScreen extends StatefulWidget {
  SelectedNameScreen({super.key, this.task});
  taskModel? task;
  @override
  State<SelectedNameScreen> createState() => _SelectedNameScreenState();
}

final TextEditingController userNameController = TextEditingController();
final box2 = Hive.box('userName');

class _SelectedNameScreenState extends State<SelectedNameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Image.asset(
              'assets/images/editTask.png',
              height: 300,
            ),
            SizedBox(height: 20),
            Text(
              'اسمت چیه؟',
              style: TextStyle(
                color: Color(0xFF18DAA3),
                fontSize: 27,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'نام کاربریت رو به فارسی وارد کن',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black26,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Spacer(),
            SizedBox(height: 100),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: 62,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(215, 215, 215, 0.4),
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
                                hintText: '  نام کاربری (فارسی)',
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
            SizedBox(height: 33),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 50),
                backgroundColor: Color(0xFF18DAA3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                userNameController.text == ''
                    ? NotificationShow(context, 'لطفا نام کاربری رو وارد کن.',
                        ToastificationType.error)
                    : Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                box2.put(6, userNameController.text);
                widget.task?.userName = userNameController.text;
                setState(() {});
                isFirstTime = false;
                box2.put(7, isFirstTime);
                print(box2.get(7));
              },
              child: Text(
                'بزن بریم',
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
