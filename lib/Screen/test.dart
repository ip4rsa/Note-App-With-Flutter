import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
            ),
            Text(_nameController.text),
            TextButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('submit'))
          ],
        ),
      ),
    );
  }
}
