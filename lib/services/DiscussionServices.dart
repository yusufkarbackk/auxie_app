import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auxie_app/models/DiscussionModel.dart';
import 'package:auxie_app/models/CommentModel.dart';

class DiscussionServices {
  static CollectionReference _discussionsCollection =
      FirebaseFirestore.instance.collection("discussions");

  static CollectionReference _commentsCollection =
      FirebaseFirestore.instance.collection("comments");

  static Future<void> createDiscussion(Discussion discussion) async {
    await _discussionsCollection.add({
      "title": discussion.title,
      "time": discussion.time.millisecondsSinceEpoch
    });
  }

  static Stream<QuerySnapshot> getDiscussion() {
    Stream<QuerySnapshot> snapshots = _discussionsCollection.snapshots();

    return snapshots;
  }

  static Future<void> createComment(Comment comment) async {
    await _commentsCollection.add({
      "discussionId": comment.discussionId,
      "comment": comment.comment,
    });
  }

  static Stream<QuerySnapshot> getComments(String discussionId) {
    Stream<QuerySnapshot> snapshots = _commentsCollection
        .where("discussionId", isEqualTo: discussionId)
        .snapshots();

    return snapshots;
  }
}
