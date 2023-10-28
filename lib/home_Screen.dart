import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
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
  bool isChecked = false;

  var mobileBox = Hive.box<Mobile>('mobileBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: Center(
          child: getTaskItems(),
        ),
      ),
    );
  }

  Container getTaskItems() {
    return Container(
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
        child: getMainContant(),
      ),
    );
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
                  MSHCheckbox(
                    size: 28,
                    value: isChecked,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: const Color(0xFF18DAA3),
                    ),
                    style: MSHCheckboxStyle.fillScaleCheck,
                    onChanged: (selected) {
                      setState(
                        () {
                          isChecked = selected;
                        },
                      );
                    },
                  ),
                  Text(
                    'تمرین زبان انگلیسی',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Text(' زبان انگلیسی کتاب آموزشگاه'),
              Spacer(),
              getTimeAndEditBTN()
            ],
          ),
        ),
        const SizedBox(width: 15),
        Image.asset('assets/images/Dictionary-pana1.png'),
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
              Radius.circular(16.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '۱۰:۰۰',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.24,
                ),
              ),
              Image.asset('assets/images/Time.png'),
            ],
          ),
        ),
        const SizedBox(width: 15),
        Container(
          width: 83,
          height: 28,
          decoration: const BoxDecoration(
            color: Color(0xFFE2F6F1),
            borderRadius: BorderRadius.all(
              Radius.circular(16.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'ویرایش',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF18DAA3),
                  fontSize: 12,
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.24,
                ),
              ),
              Image.asset('assets/images/Edit.png'),
            ],
          ),
        ),
      ],
    );
  }
}
