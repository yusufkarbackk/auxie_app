import 'package:flutter/material.dart';
import 'package:auxie_app/shared/SharedStyle.dart';

class DiscussionContent extends StatefulWidget {
  final String text;

  DiscussionContent({this.text});

  @override
  _DiscussionContentState createState() => _DiscussionContentState();
}

class _DiscussionContentState extends State<DiscussionContent> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.grey[350], spreadRadius: 2, blurRadius: 2),
          ]),
      child: Column(
        children: [
          Text(
            widget.text,
            style: plainText.copyWith(fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    controller: commentController,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Container(
                child: Icon(Icons.send_rounded),
              )
            ],
          ),
        ],
      ),
    );
  }
}
