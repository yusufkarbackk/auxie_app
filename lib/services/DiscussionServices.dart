import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auxie_app/models/DiscussionModel.dart';

class DiscussionServices {
  static CollectionReference _discussionsCollection =
      FirebaseFirestore.instance.collection("discussions");

  static Future<void> createDiscussion(Discussion discussion) async {
    await _discussionsCollection
        .add({"title": discussion.title, "time": discussion.time.millisecondsSinceEpoch});
  }

  static Stream<QuerySnapshot> getDiscussion() {
    Stream<QuerySnapshot> snapshots = _discussionsCollection.snapshots();

    return snapshots;
  }
}
