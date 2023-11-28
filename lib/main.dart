import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/Screen/introSlider_screen.dart';
import 'package:note_app/Screen/main_Screen.dart';
import 'package:note_app/Screen/selectedName_screen.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/data/task.dart';
import 'package:note_app/data/taskType_Enum.dart';
import 'package:note_app/data/task_taype_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(taskModelAdapter());
  Hive.registerAdapter(taskTypeEnumAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  await Hive.openBox<taskModel>('TaskBox');
  await Hive.openBox('userName');
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(NoteApp(savedThemeMode: savedThemeMode));
}

bool isFirstTime = box2.get(7, defaultValue: true);

class NoteApp extends StatelessWidget {
  NoteApp({super.key, AdaptiveThemeMode? savedThemeMode});
  var savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primaryColor: green,
        fontFamily: 'Shabnam',
        useMaterial3: true,
        scaffoldBackgroundColor: Color.fromARGB(255, 249, 249, 249),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 255, 255, 255)),
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 249, 249, 249)),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: green,
        fontFamily: 'Shabnam',
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20),
        badgeTheme: BadgeThemeData(backgroundColor: Colors.amber),
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        textTheme: TextTheme(
            displayLarge:
                TextStyle(color: const Color.fromARGB(255, 246, 246, 246))),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(backgroundColor: Colors.black),
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home: isFirstTime ? introSliderScreen() : MainScreen(),
      ),
    );
  }
}
