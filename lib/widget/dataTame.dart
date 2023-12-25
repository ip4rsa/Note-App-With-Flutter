import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class dataTime extends StatefulWidget {
  dataTime({super.key});

  @override
  State<dataTime> createState() => _dataTimeState();
}

String label = '';

class _dataTimeState extends State<dataTime> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text('تنظیم تاریخ'),
      onPressed: () async {
        Jalali? pickedDate = await showModalBottomSheet<Jalali>(
          context: context,
          builder: (context) {
            Jalali? tempPickedDate;
            return Container(
              height: 250,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CupertinoButton(
                          child: Text(
                            'لغو',
                            style: TextStyle(
                              fontFamily: 'shabnam',
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        CupertinoButton(
                          child: Text(
                            'تایید',
                            style: TextStyle(
                              fontFamily: 'shabnam',
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pop(tempPickedDate ?? Jalali.now());
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: PCupertinoDatePicker(
                        mode: PCupertinoDatePickerMode.dateAndTime,
                        onDateTimeChanged: (Jalali dateTime) {
                          tempPickedDate = dateTime;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );

        if (pickedDate != null) {
          setState(() {
            label = '${pickedDate.toDateTime()}';
          });
        }
      },
    );
  }
}
