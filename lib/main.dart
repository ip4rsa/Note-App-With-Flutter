import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = Hive.openBox('Names');
  runApp(NoteApp());
}

class NoteApp extends StatefulWidget {
  const NoteApp({super.key});

  @override
  State<NoteApp> createState() => _NoteAppState();
}

var _controller = TextEditingController();

String _text = '';
var booob = '';

@override
class _NoteAppState extends State<NoteApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
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
                child: Text('Clicke'),
                onLongPress: () {
                  setState(() {
                    _text = '';
                    print(booob);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
