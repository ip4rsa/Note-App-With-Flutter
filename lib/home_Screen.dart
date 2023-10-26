import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/car.dart';

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
                  box.put(1, 'Parsa');
                },
              ),
              ElevatedButton(
                child: const Text('Read'),
                onPressed: () {
                  var getText = box.get(1);
                  print(getText);
                },
              ),
              ElevatedButton(
                child: const Text('update'),
                onPressed: () {
                  box.put(1, 'Sajjadian');
                },
              ),
              ElevatedButton(
                child: const Text('delete'),
                onPressed: () {
                  box.delete(1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
