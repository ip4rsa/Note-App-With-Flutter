import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:note_app/Screen/selectedName_screen.dart';

class introSliderScreen extends StatefulWidget {
  const introSliderScreen({super.key});

  @override
  State<introSliderScreen> createState() => _introSliderScreenState();
}

class _introSliderScreenState extends State<introSliderScreen> {
  bool isFirstTime = false;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyIntroSlider(),
    );
  }
}

class MyIntroSlider extends StatelessWidget {
  final Color kDarkBlueColor = const Color(0xFF18DAA3);
  const MyIntroSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'ادامه',
      addButton: true,
      onFinish: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => SelectedNameScreen(),
          ),
        );
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: Color(0xFF18DAA3),
      ),
      skipTextButton: Text(
        '',
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        '',
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => SelectedNameScreen(),
          ),
        );
      },
      controllerColor: kDarkBlueColor,
      totalPage: 3,
      headerBackgroundColor: const Color.fromARGB(255, 250, 250, 250),
      pageBackgroundColor: const Color.fromARGB(255, 250, 250, 250),
      background: [
        Image.asset(
          'assets/images/addTaskk.png',
          height: 400,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Image.asset(
            'assets/images/leftTachPhoto.png',
            height: 170,
          ),
        ),
        Image.asset(
          'assets/images/cheel.png',
          height: 400,
        ),
      ],
      speed: 2,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 390,
              ),
              Text(
                'وقتشه با برنامه عمل کنی',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'تسک ها و کارهایی که باید انجام بدی رو میتونی توی تسکیار مشخص کنی و انجامشون بدی',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 390,
              ),
              Text(
                'تمومش کردی؟ پاکش کن',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'واسه پاک کردن تسک های انجام شده، کافیه اون تسک رو به سمت چب بکشی',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 450,
              ),
              Text(
                'به تَسکیار خوش اومدی',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                ':) موفق باشی',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
