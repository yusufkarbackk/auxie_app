import 'package:flutter/material.dart';
import '../shared/SharedStyle.dart';

class CalmYourselfCard extends StatelessWidget {
  final String title;
  final String body;

  CalmYourselfCard(this.title, this.body);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titledText.copyWith(color: Colors.white)),
        SizedBox(
          height: 18,
        ),
        Text(body, style: plainText.copyWith(color: Colors.white,)),
      ],
    ));
  }
}
