import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/car.dart';
import 'package:note_app/mobile.dart';
import 'package:note_app/student.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

String _text = '';
var _controller = TextEditingController();

class _homeScreenState extends State<homeScreen> {
  var box = Hive.box('Names');
  // var carBox = Hive.box<car>('CarBox');
  // var studentBox = Hive.box<student>('StudentBox');
  var mobileBox = Hive.box<Mobile>('mobileBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/Dictionary-pana1.png'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
