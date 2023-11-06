import 'package:flutter/material.dart';
import 'package:note_app/constants/colors.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

final TextEditingController _nameController = TextEditingController();

class _testState extends State<test> {
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
              ':) شما درحال حاظر تسکی برای انجام ندارید',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 13, color: gray),
            ),
          ],
        ),
      ),
    );
  }
}
