import 'package:auxie_app/widgets/CommentWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(
        vertical: 12,
      ),
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
          StreamBuilder<QuerySnapshot>(
            stream: DiscussionServices.getComments(widget.discussionId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final comments = snapshot.data.docs;
                List<CommentWidget> commentList = [];
                for (var comment in comments) {
                  Comment commentText =
                      Comment(comment: comment.data()["comment"]);
                  commentList.add(CommentWidget(
                    comment: commentText,
                  ));
                }
                return Column(
                  children: commentList,
                );
              } else if (!snapshot.hasData) {
                return Container(
                    child: Center(
                  child: Text("Error gettting comments"),
                ));
              } else {
                return Container(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
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
              GestureDetector(
                onTap: () async {
                  Comment comment = Comment(
                      discussionId: widget.discussionId,
                      comment: commentController.text);
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
