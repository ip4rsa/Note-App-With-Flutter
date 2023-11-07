import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class getAppBar extends StatelessWidget {
  getAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(23),
        bottomRight: Radius.circular(23),
      ),
      child: AppBar(
        surfaceTintColor: const Color(0xFFFAFAFA),
        backgroundColor: const Color(0xFFFAFAFA),
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Container(
            alignment: Alignment.center,
            width: 87,
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
                color: Color(0xFF18DAA3),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        actions: [
          Image.asset('assets/images/hand.png', scale: 4),
          SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Row(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'سلام ، ',
                        style: TextStyle(
                          color: Color(0xFF1C1F2E),
                          fontSize: 16,
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      TextSpan(
                        text: ('کاربر گرامی'),
                        style: TextStyle(
                          color: Color(0xFF18DAA3),
                          fontSize: 16,
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
