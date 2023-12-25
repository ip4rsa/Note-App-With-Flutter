import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/data/task.dart';
import 'package:note_app/widget/appBar_widget.dart';
import 'package:note_app/widget/dataTame.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class yadavar extends StatefulWidget {
  const yadavar({super.key});

  @override
  State<yadavar> createState() => _yadavarState();
}

class _yadavarState extends State<yadavar> {
  @override
  Widget build(BuildContext context) {
    String label = '';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: Animate(
          effects: [FadeEffect(duration: Duration(milliseconds: 400))],
          child: getAppBar(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            Center(
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: gray,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
