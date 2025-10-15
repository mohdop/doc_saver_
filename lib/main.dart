import 'package:doc_saver/pages/home/home.dart';
import 'package:doc_saver/pages/Onboarding/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Onboarding(), // Commence par le splash screen
    initialRoute:"/" ,
    routes: {
      '/home': (context) => const Home(),
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}