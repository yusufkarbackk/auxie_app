import 'package:auxie_app/shared/SharedStyle.dart';
import 'package:flutter/material.dart';
import 'DiaryScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryUpdateScreen extends StatefulWidget {
  var diaryId;
  var title;
  var body;

  DiaryUpdateScreen({this.diaryId, this.body, this.title});

  @override
  _DiaryUpdateScreenState createState() => _DiaryUpdateScreenState();
}

class _DiaryUpdateScreenState extends State<DiaryUpdateScreen> {
  CollectionReference notes = FirebaseFirestore.instance.collection("notes");

  TextEditingController titleController = TextEditingController();

  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    titleController.text = widget.title.toString();
    bodyController.text = widget.body.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: auxieWhite,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                              hintText: "Enter your note title",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              fillColor: Colors.white,
                              filled: true)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      height: 100,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Enter your note",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        keyboardType: TextInputType.multiline,
                        expands: true,
                        maxLines: null,
                        minLines: null,
                        controller: bodyController,
                      ),
                    )
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    notes.doc(widget.diaryId.toString()).update({
                      "title": titleController.text,
                      "body": bodyController.text,
                    });
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => DiaryScreen()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ));
    ;
  }
}
