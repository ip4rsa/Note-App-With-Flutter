// ignore_for_file: must_be_immutable
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Screen/EmptyTask.dart';
import 'package:note_app/Screen/setting_Screen.dart';
import 'package:note_app/data/task.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class getAppBar extends StatefulWidget {
  getAppBar({super.key, this.task, TextEditingController});
  taskModel? task;

  @override
  State<getAppBar> createState() => _getAppBarState();
}

class _getAppBarState extends State<getAppBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(23),
        bottomRight: Radius.circular(23),
      ),
      child: AppBar(
        surfaceTintColor: const Color(0xFFFAFAFA),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 6),
              child: Container(
                alignment: Alignment.center,
                width: 85,
                height: 31,
                decoration: ShapeDecoration(
                  color: Color(0xFFE2F6F1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: Text(
                  Jalali.now().formatMediumDate(),
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AdaptiveTheme.of(context).isDefault
                        ? Color(0xFF18DAA3)
                        : Color.fromARGB(255, 19, 166, 124),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/hand.png', scale: 4),
                  SizedBox(width: 6),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'سلام، ',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Shabnam',
                              fontWeight: FontWeight.w900,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          TextSpan(
                            text: (box2.get(6) ?? 'کاربر گرامی'),
                            style: TextStyle(
                              color: Color(0xFF18DAA3),
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, top: 4),
                child: Text(
                  'همه تسک ها: ${taskBox.length.toString()}',
                  style: TextStyle(
                    color: AdaptiveTheme.of(context).isDefault
                        ? Color(0xFFBFC3C8)
                        : Color.fromARGB(213, 191, 195, 200),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
