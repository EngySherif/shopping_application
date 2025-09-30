import 'package:flutter/material.dart';
import 'screens/WelcomeScreen.dart';
import 'screens/SignUpScreen.dart';
import 'screens/SignInScreen.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        fontFamily: 'Suwannaphum',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/signin': (context) => const SignInScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

