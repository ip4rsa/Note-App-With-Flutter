import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/car.dart';
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
  var carBox = Hive.box<car>('CarBox');
  var studentBox = Hive.box<student>('StudentBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Home'),
              TextField(
                controller: _controller,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  box.get(2) ?? 'Null',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  box.put(2, _controller.text);

                  setState(() {});
                },
                child: const Text('show text'),
                onLongPress: () {
                  setState(
                    () {
                      _text = '';
                    },
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Create'),
                onPressed: () {
                  // box.put(1, 'Parsa');
                  // carBox.put(
                  //     1, car(name: 'Tesla', price: 12000, topSpeed: 300));
                  studentBox.put(
                      1,
                      student(
                          name: 'Parsa', famly: 'Tesla', age: 19, grade: 21));
                },
              ),
              ElevatedButton(
                child: const Text('Read'),
                onPressed: () {
                  print(studentBox.get(1)!.famly);
                },
              ),
              ElevatedButton(
                child: const Text('update'),
                onPressed: () {
                  carBox.put(
                      1, car(name: 'Mercedes', price: 900000, topSpeed: 400));
                },
              ),
              ElevatedButton(
                child: const Text('delete'),
                onPressed: () {
                  carBox.delete(1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
