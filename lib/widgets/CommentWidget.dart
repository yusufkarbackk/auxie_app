import 'package:flutter/material.dart';
import 'package:auxie_app/models/CommentModel.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  CommentWidget({this.comment});
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
              Expanded(child: Text(comment.comment))
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
