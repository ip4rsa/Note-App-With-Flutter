import 'package:flutter/material.dart';
import 'package:note_app/constants/colors.dart';

class EmptyTask extends StatefulWidget {
  const EmptyTask({super.key});

  @override
  State<EmptyTask> createState() => _EmptyTaskState();
}

final TextEditingController _nameController = TextEditingController();

class _EmptyTaskState extends State<EmptyTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/NotFoundTask.png', height: 230),
            SizedBox(height: 10),
            Text(
              ':) شما درحال حاضر تسکی برای انجام ندارید',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 13, color: gray),
            ),
          ],
        ),
      ),
    );
  }
}
