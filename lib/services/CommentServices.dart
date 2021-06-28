import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auxie_app/widgets/TempCommentWidget.dart';
import 'package:flutter/material.dart';
import 'package:auxie_app/services/DiscussionServices.dart';
import 'package:auxie_app/models/CommentModel.dart';

class CommentServices extends StatefulWidget {
  final String id;

  CommentServices({this.id});

  @override
  _CommentServicesState createState() => _CommentServicesState();
}

class _CommentServicesState extends State<CommentServices> {
  TextEditingController commentController = TextEditingController();
  bool isViewAll = false;
  int commentCount;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: DiscussionServices.getComments(widget.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final comments = snapshot.data.docs;

          commentCount = comments.length;

          // NOTE: IF THE COMMENTS ARE MORE THAN 3

          if (comments.length > 3) {
            if (isViewAll == false) {
              final newComments = comments.take(3);
              List<Comment> listOfComment = [];
              for (var comment in newComments) {
                Comment commentText =
                    Comment(comment: comment.data()["comment"]);
                listOfComment.add(commentText);
              }
              Iterable<Comment> reversedCommentList = listOfComment.reversed;

              List<TempCommentWidget> tempComment = reversedCommentList
                  .map((comment) => TempCommentWidget(text: comment.comment))
                  .toList();

              return Column(children: [
                Column(children: [
                  Column(children: tempComment),
                  Container(
                    width: double.infinity,
                    height: 80,
                    child: Row(children: [
                      Text("$commentCount comments"),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Text("View all"),
                        onTap: (() {
                          setState(() {
                            isViewAll = !isViewAll;
                          });
                        }),
                      )
                    ]),
                  )
                ])
              ]);
            } else {
              List<Comment> commentList = [];
              for (var comment in comments) {
                Comment commentText =
                    Comment(comment: comment.data()["comment"]);
                commentList.add(commentText);
              }
              Iterable<Comment> reversedCommentList = commentList.reversed;
              List<TempCommentWidget> tempComment = reversedCommentList
                  .map((comment) => TempCommentWidget(text: comment.comment))
                  .toList();
              return Column(children: [
                Column(children: tempComment),
                Container(
                  width: double.infinity,
                  height: 80,
                  child: Row(children: [
                    Text("$commentCount comments"),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: Text("View less"),
                      onTap: (() {
                        setState(() {
                          isViewAll = !isViewAll;
                        });
                      }),
                    )
                  ]),
                )
              ]);
            }
          } else if (comments.length == 0) {
            return Container();
          } else {
            List<Comment> commentList = [];
            for (var comment in comments) {
              Comment commentText = Comment(comment: comment.data()["comment"]);
              commentList.add(commentText);
            }
            Iterable<Comment> reversedCommentList = commentList.reversed;
            List<TempCommentWidget> tempComment = reversedCommentList
                .map((comment) => TempCommentWidget(text: comment.comment))
                .toList();
            return Column(
              children: [
                Column(children: tempComment),
              ],
            );
          }
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
    );
  }
}
