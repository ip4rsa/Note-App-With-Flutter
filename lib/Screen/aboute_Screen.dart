import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutePage extends StatelessWidget {
  const AboutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/giphy.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Animate(
                effects: [
                  FadeEffect(
                    delay: Duration(milliseconds: 400),
                    duration: Duration(milliseconds: 1500),
                  ),
                ],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'نسخه 1.5.0',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'تَسکیار',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Image.asset('assets/images/icon.png', height: 80),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Animate(
                effects: [
                  FadeEffect(
                    delay: Duration(milliseconds: 1500),
                    duration: Duration(seconds: 2),
                  ),
                ],
                child: Text(
                  'ساخته  ♥  توسط پارسا سجادیان',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Animate(
                effects: [
                  FadeEffect(
                    delay: Duration(milliseconds: 1500),
                    duration: Duration(seconds: 2),
                  ),
                  ShimmerEffect(
                    delay: Duration(
                      milliseconds: 3100,
                    ),
                    duration: Duration(seconds: 2),
                  ),
                ],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.checkmark_seal_fill,
                      size: 17,
                      color: Color(0xFF18DAA3),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'ip4rsa@gmail.com',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: '',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
