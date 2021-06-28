import 'package:auxie_app/services/CommentServices.dart';
import 'package:flutter/material.dart';
import 'package:auxie_app/shared/SharedStyle.dart';
import 'package:auxie_app/services/DiscussionServices.dart';
import 'package:auxie_app/models/CommentModel.dart';

class DiscussionContent extends StatefulWidget {
  final String text;
  final String discussionId;

  DiscussionContent({this.text, this.discussionId});

  @override
  _DiscussionContentState createState() => _DiscussionContentState();
}

class _DiscussionContentState extends State<DiscussionContent> {
  TextEditingController commentController = TextEditingController();
  bool isViewAll = false;
  int commentCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
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
            height: 22,
          ),
          Divider(),
          SizedBox(
            height: 22,
          ),
          //NOTE: COMMENT SECTION
          CommentServices(
            id: widget.discussionId,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    controller: commentController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Comment comment = Comment(
                      discussionId: widget.discussionId,
                      comment: commentController.text,
                      time: DateTime.now());
                  await DiscussionServices.createComment(comment);
                  commentController.text = "";
                },
                child: Container(
                  child: Icon(Icons.send_rounded),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
