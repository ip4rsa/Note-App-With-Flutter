import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

String _text = '';
var _controller = TextEditingController();

class _homeScreenState extends State<homeScreen> {
  var box = Hive.box('Names');
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
                padding: const EdgeInsets.all(20.0),
                child: Text(_text),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _text = _controller.text;
                  });
                },
                child: Text('show text'),
                onLongPress: () {
                  setState(
                    () {
                      _text = '';
                    },
                  );
                },
              ),
              ElevatedButton(
                child: Text('Create'),
                onPressed: () {
                  box.put(1, 'Parsa');
                },
              ),
              ElevatedButton(
                child: Text('Read'),
                onPressed: () {
                  var getText = box.get(1);
                  print(getText);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
