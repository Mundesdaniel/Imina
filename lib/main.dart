//import 'package:app1/home_screem.dart';
import 'package:app1/home_screem.dart';
import 'package:app1/splashscreen.dart';
import 'package:flutter/material.dart';
//import './home_screem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zia Zia Abia Na kitabu Kpe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 1, 12, 20),
          foregroundColor: const Color.fromARGB(255, 249, 250, 247),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: SplashScreen(),
      routes: {
        '/main': (context) => HomeScreen(),
        '/storyDetail': (context) => StoryDetailScreen(storyNumber: 42),
      },
    );
  }
}

class StoryDetailScreen extends StatelessWidget {
  final int? storyNumber;

  const StoryDetailScreen({this.storyNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/main', arguments: 42);
          },
          child: Text('Abia na kitabu kpe'),
        ),
      ),
    );
  }
}
