import 'package:auxie_app/services/DiaryServices.dart';
import 'package:auxie_app/shared/SharedStyle.dart';
import 'package:flutter/material.dart';
import '../bloc/blocs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/DiaryCard.dart';
import '../bloc/page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaryScreen extends StatefulWidget {
  final String id;

  DiaryScreen(this.id);
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  CollectionReference diaries =
      FirebaseFirestore.instance.collection("diaries");

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToMainPage());
          return;
        },
        child: Scaffold(
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
                          stream: DiaryServices.getDiaries(widget.id),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Container(
                                child: Center(
                                  child: Text("error getting notes"),
                                ),
                              );
                            } else if (snapshot.hasData) {
                              if (snapshot.data.size == 0) {
                                return Center(
                                  child: Text("still empty"),
                                );
                              } else {
                                return Column(
                                    children: snapshot.data.docs
                                        .map((diary) => Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 15),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  context.bloc<PageBloc>().add(
                                                      GoToDiaryShowPage(
                                                          diary.id, widget.id));
                                                },
                                                child: DiaryCard(
                                                  title: diary.data()["title"],
                                                  body: diary.data()["body"],
                                                  onEdit: () {
                                                    context.bloc<PageBloc>().add(
                                                        GoToDiaryUpdatePage(
                                                            userId: widget.id,
                                                            diaryId: diary.id,
                                                            diaryTitle:
                                                                diary.data()[
                                                                    "title"],
                                                            diaryBody:
                                                                diary.data()[
                                                                    "body"]));
                                                  },
                                                  onDelete: () {
                                                    DiaryServices.deleteDiary(
                                                        diary.id);
                                                  },
                                                ),
                                              ),
                                            ))
                                        .toList());
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
                      backgroundColor: auxieGreen,
                      onPressed: () {
                        context
                            .bloc<PageBloc>()
                            .add(GoToDiaryAddPage(id: widget.id));
                      },
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column getDiaryList(List diaries, double width) {
    return Column(
        children: diaries
            .map((diary) => Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: DiaryCard(
                    onEdit: () {
                      DiaryServices.diaryCollection.doc(diary.id).update({
                        "title": titleController.text,
                        "body": bodyController.text
                      });
                    },
                    onDelete: () {
                      var diaryId = DiaryServices.diaryCollection.id;
                      DiaryServices.deleteDiary(diaryId);
                    },
                  ),
                ))
            .toList());
  }
}
