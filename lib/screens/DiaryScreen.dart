import 'package:auxie_app/shared/SharedStyle.dart';
import 'package:flutter/material.dart';
import 'DiaryAddScreen.dart';
import 'DiaryUpdateScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/DiaryCard.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  CollectionReference notes = FirebaseFirestore.instance.collection("notes");
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: auxieWhite,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            width: double.infinity,
            child: Stack(
              children: [
                ListView(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: notes.snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Container(
                              child: Center(
                                child: Text("error getting notes"),
                              ),
                            );
                          } else if (snapshot.hasData) {
                            if (snapshot.data.docs.length == 0) {
                              return Center(
                                child: Text("still empty"),
                              );
                            } else {
                              return Column(
                                children: snapshot.data.docs
                                    .map(
                                      (e) => Column(
                                        children: [
                                          DiaryCard(
                                            diaryId: e.id,
                                            title: e.data()["title"],
                                            body: e.data()["body"],
                                            onDelete: () {
                                              notes
                                                  .doc(e.id.toString())
                                                  .delete();
                                            },
                                            onEdit: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DiaryUpdateScreen(
                                                            title: e.data()[
                                                                'title'],
                                                            diaryId: e.id,
                                                            body: e
                                                                .data()['body'],
                                                          )));
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    )
                                    .toList(),
                              );
                            }
                          }
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiaryAddScreen())),
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
