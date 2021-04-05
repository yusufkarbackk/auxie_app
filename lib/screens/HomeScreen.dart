import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/SharedStyle.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/QuickActButton.dart';
import '../widgets/WebinarBanner.dart';
import 'CalmYourselfScreen.dart';
import 'DiaryScreen.dart';
import '../services/AuthServices.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: auxieWhite,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello,",
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(fontSize: 22, color: Colors.black))),
                  BlocBuilder<UserBloc, UserStat>(
                    child: Text("Pertiwi",
                        style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(fontSize: 28, color: Colors.black))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    //quotes
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0XFF81b29a),
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("Quotes of the day for you",
                            maxLines: 5,
                            overflow: TextOverflow.visible,
                            style: titledText.copyWith(
                                color: Colors.white, fontSize: 22))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "What Can We Help?",
                    style: titledText,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: QuickActButton(
                                action: "Self Diagnose",
                                icon: Icons.data_usage,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CalmYourselfScreen()));
                              },
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              child: QuickActButton(
                                action: "Calm Yourself",
                                icon: Icons.self_improvement,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CalmYourselfScreen()));
                              },
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              child: QuickActButton(
                                  action: "Your Diary",
                                  icon: Icons.book_rounded),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DiaryScreen())),
                            ),
                            SizedBox(width: 10),
                            QuickActButton(
                                action: "Disscussion",
                                icon: Icons.question_answer),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () async {
                                await AuthServices.signOut();
                              },
                              child: QuickActButton(
                                  action: "Appointment",
                                  icon: Icons.medical_services_rounded),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text("Join Our Webinar", style: titledText),
                  SizedBox(height: 10),
                  WebinarBanner(
                    event: "Brighting your Day",
                    desc: "We're gonna talk abot overthingking",
                    date: "December 26th 2021",
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
