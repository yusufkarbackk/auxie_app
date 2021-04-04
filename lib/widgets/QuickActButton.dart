import 'package:flutter/material.dart';
import '../shared/SharedStyle.dart';

class QuickActButton extends StatelessWidget {
  final String action;
  final IconData icon;

  QuickActButton({this.action, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: auxieOrange,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
              child: Icon(
            icon,
            size: 30,
            color: auxieWhite,
          )),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          action,
          style: plainText.copyWith(color: Color(0xFF2F3E46), fontSize: 12),
        )
      ],
    );
  }
}
