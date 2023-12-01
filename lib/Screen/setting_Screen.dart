// ignore_for_file: must_be_immutable, deprecated_member_use
import 'dart:ui';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Screen/aboute_Screen.dart';
import 'package:note_app/constants/dividers.dart';
import 'package:note_app/constants/notifShow.dart';
import 'package:note_app/data/task.dart';
import 'package:hive/hive.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key, this.task});
  taskModel? task;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

final TextEditingController userNameController = TextEditingController();
final box2 = Hive.box('userName');
final box = Hive.box<taskModel>('TaskBox');

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            getSettingSection1(),
            SizedBox(height: 20),
            getSettingSection2(),
            SizedBox(height: 110),
          ],
        ),
      ),
    );
  }

  Center getSettingSection1() {
    return Center(
      child: GestureDetector(
        onTap: () {
          (value) {
            // setState(() {
            //   if (value) {
            //     AdaptiveTheme.of(context).setDark();
            //   } else {
            //     AdaptiveTheme.of(context).setLight();
            //   }
            // });
            // print('objessssssssssct');
          };
        },
        child: Container(
          width: 332,
          height: 80,
          decoration: ShapeDecoration(
            color: AdaptiveTheme.of(context).isDefault
                ? Colors.white
                : Colors.black,
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
                    value: AdaptiveTheme.of(context).mode.isDark,
                    onChanged: (value) {
                      if (value) {
                        AdaptiveTheme.of(context).setDark();
                      } else {
                        AdaptiveTheme.of(context).setLight();
                      }
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
          color:
              AdaptiveTheme.of(context).isDefault ? Colors.white : Colors.black,
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
                  showModelBottomSheet(context);
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
                        ' تغیر نام کاربری',
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
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutePage(),
                      ));
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
                        'درباره تسکیار',
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
              ),
              DividerSetting,
              GestureDetector(
                onTap: () async {
                  launch("https://myket.ir/app/com.example.note_app");
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
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
  }
}

class getChengeUserName extends StatefulWidget {
  getChengeUserName({super.key, this.task});
  taskModel? task;

  @override
  State<getChengeUserName> createState() => _getChengeUserNameState();
}

class _getChengeUserNameState extends State<getChengeUserName> {
  var text = userNameController.text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                          style: TextStyle(color: Colors.black),
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
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(200, 50),
            shadowColor: Colors.transparent,
            backgroundColor: Color.fromARGB(255, 22, 179, 134),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          onPressed: () {
            box2.put(6, userNameController.text);
            widget.task?.userName = userNameController.text;
            setState(() {});
            print(widget.task?.userName);
            userNameController.text == ''
                ? NotificationShow(
                    context, 'نام کاربری غیر معتبر', ToastificationType.error)
                : NotificationShow(
                    context,
                    'نام کاربری شما با موفیت تغییر یافت',
                    ToastificationType.success);
          },
          child: Text(
            'ذخیره',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        // box.add(name);
        // task?.save();
      ],
    );
  }
}
