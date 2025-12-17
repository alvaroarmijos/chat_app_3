import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/background.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.asset('assets/icons/icon_app.png'),
                    Text(
                      'Connect friends easily & quickly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 68,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Our chat app is the perfect way to stay connected with friends and family.',
                      style: TextStyle(fontSize: 16, color: Color(0xFFB9C1BE)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/icons/icon_facebook.png'),
                        Image.asset('assets/icons/icon_google.png'),
                        Image.asset('assets/icons/icon_apple.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
