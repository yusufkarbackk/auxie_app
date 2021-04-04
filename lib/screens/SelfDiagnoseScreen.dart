import 'package:flutter/material.dart';

class SelfDiagnoseScreen extends StatefulWidget {
  @override
  _SelfDiagnoseScreenState createState() => _SelfDiagnoseScreenState();
}

class _SelfDiagnoseScreenState extends State<SelfDiagnoseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F1DE),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: ListView(
            children: [],
          ),
        ),
      ),
    );
  }
}
