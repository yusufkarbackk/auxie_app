import 'package:auxie_app/bloc/user_bloc.dart';
import 'package:auxie_app/shared/SharedStyle.dart';
import 'package:flutter/material.dart';
import '../models/Diary.dart';
import '../services/DiaryServices.dart';
import '../bloc/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaryAddScreen extends StatefulWidget {
  final String id;

  DiaryAddScreen({this.id});

  @override
  _DiaryAddScreenState createState() => _DiaryAddScreenState();
}

class _DiaryAddScreenState extends State<DiaryAddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToDiaryPage(widget.id));
          return;
        },
        child: Scaffold(
          backgroundColor: auxieBlue,
          body: SafeArea(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, userState) {
                        if (userState is UserLoaded) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hello,",
                                  style:
                                      titledText.copyWith(color: Colors.white)),
                              Text(userState.user.name,
                                  style:
                                      titledText.copyWith(color: Colors.white)),
                              Text("How Was Your Day?",
                                  style:
                                      titledText.copyWith(color: Colors.white))
                            ],
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                              hintText: "Enter your diary title",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              fillColor: Colors.white,
                              filled: true)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      height: 250,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Enter your diary",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fillColor: Colors.white,
                            filled: true),
                        keyboardType: TextInputType.multiline,
                        expands: true,
                        maxLines: null,
                        minLines: null,
                        controller: bodyController,
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: RaisedButton(
                          onPressed: () async {
                            Diary diary = Diary(
                                userId: widget.id.toString(),
                                body: bodyController.text,
                                title: titleController.text);
                            await DiaryServices.createDiary(diary);
                            context
                                .bloc<PageBloc>()
                                .add(GoToDiaryPage(widget.id));
                          },
                          color: auxieGreen,
                          child: Center(
                              child: Text("Save",
                                  style:
                                      plainText.copyWith(color: Colors.white))),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
