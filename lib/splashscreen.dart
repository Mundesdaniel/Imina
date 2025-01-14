import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background
      body: Center(
        child: Text(
          'Zia Zia Abia \nNa\n Kitabu Kpe',
          style: TextStyle(
            fontSize: 30,
            color: Colors.amber, // Golden text color
            fontWeight: FontWeight.bold,
            fontFamily: 'YourCustomFontFamily', // Add a custom font if desired
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
