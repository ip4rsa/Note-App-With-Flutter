import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:note_app/Screen/add_task_screen.dart';
import 'package:note_app/Screen/home_Screen.dart';
import 'package:note_app/Screen/setting_Screen.dart';
import 'package:note_app/constants/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndexBottm = 0;
  double opacity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        height: 83,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Animate(
          effects: [FadeEffect(duration: Duration(milliseconds: 400))],
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: BottomNavigationBar(
              elevation: 10,
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 109,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndexBottm,
              onTap: (int index) {
                setState(() {
                  _selectedIndexBottm = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/Home.png', color: gray),
                  activeIcon:
                      Image.asset('assets/images/Home.png', color: green),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icon_add.png', color: gray),
                  activeIcon:
                      Image.asset('assets/images/icon_add.png', color: green),
                  label: '',
                ),
                // BottomNavigationBarItem(
                //   icon: Image.asset('assets/images/Settings.png', color: gray),
                //   activeIcon:
                //       Image.asset('assets/images/Settings.png', color: green),
                //   label: '',
                // ),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndexBottm,
        children: _changeScreen(),
      ),
    );
  }
}

List<Widget> _changeScreen() {
  return <Widget>[
    homeScreen(),
    addTaskScreen(),
    SettingScreen(),
  ];
}
