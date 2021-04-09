import 'package:auxie_app/services/DiaryServices.dart';
import 'package:auxie_app/shared/SharedStyle.dart';
import 'package:flutter/material.dart';
import 'DiaryUpdateScreen.dart';
import '../bloc/blocs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/DiaryCard.dart';
import '../bloc/page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/Diary.dart';

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
          context.bloc<PageBloc>().add(GoToMainPage(widget.id));
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
                      FutureBuilder<List<Diary>>(
                          future: DiaryServices.getDiaries(widget.id),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Container(
                                child: Center(
                                  child: Text("error getting notes"),
                                ),
                              );
                            } else if (snapshot.hasData) {
                              if (snapshot.data.length == 0) {
                                return Center(
                                  child: Text("still empty"),
                                );
                              } else {
                                return getDiaryList(snapshot.data,
                                    MediaQuery.of(context).size.width - 2 * 24);
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
                      onPressed: () {
                        context.bloc<PageBloc>().add(
                            GoToDiaryAddPage(id: diaries.doc().toString()));
                      },
                      child: Icon(Icons.add),
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

  Column getDiaryList(List<Diary> diaries, double width) {
    return Column(
        children: diaries
            .map((diary) => Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: DiaryCard(
                    diary: diary,
                    onEdit: () {
                      context.bloc<PageBloc>().add(GoToDiaryUpdatePage(
                            diary: diary,
                          ));
                    },
                  ),
                ))
            .toList());
  }
}
