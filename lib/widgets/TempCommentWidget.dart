import 'package:flutter/material.dart';

class TempCommentWidget extends StatelessWidget {
  final String text;
  TempCommentWidget({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.person,
                size: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(child: Text(text))
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
