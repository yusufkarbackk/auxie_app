import 'package:auxie_app/bloc/page_bloc.dart';
import 'package:auxie_app/bloc/user_bloc.dart';
import 'package:auxie_app/screens/CalmYourselfScreen.dart';
import 'package:auxie_app/screens/DiaryAddScreen.dart';
import 'package:auxie_app/screens/DiaryScreen.dart';
import 'package:auxie_app/screens/DiaryShowScreen.dart';
import 'package:auxie_app/screens/DiaryUpdateScreen.dart';
import '../screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../screens/LoginPage.dart';
import 'SplashPage.dart';
import 'SignUpPage.dart';
import 'ProfileScreen.dart';
import 'Screens.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);

    if (firebaseUser == null) {
      context.bloc<PageBloc>().add(GoToSplashPage());
    } else {
      context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
      context.bloc<PageBloc>().add(GoToMainPage(id: firebaseUser.uid));
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnSignUpPage)
                ? SignUpPage()
                : (pageState is OnSignInPage)
                    ? LoginPage()
                    : (pageState is OnDiaryPage)
                        ? DiaryScreen(pageState.id)
                        : (pageState is OnDiaryAddPage)
                            ? DiaryAddScreen(
                                id: pageState.id,
                              )
                            : (pageState is OnDiaryUpdatepage)
                                ? DiaryUpdateScreen(
                                    pageState.diaryTitle,
                                    pageState.diaryBody,
                                    pageState.diaryId,
                                    pageState.userId)
                                : (pageState is OnDiaryShowPage)
                                    ? DiaryShowScreen(
                                        pageState.diaryId, pageState.userId)
                                    : (pageState is OnCalmYourselfPage)
                                        ? CalmYourselfScreen()
                                        : (pageState is OnProfilePage)
                                            ? ProfileScreen(pageState.id)
                                            : (pageState is OnDisscusionPage)
                                                ? DiscussionScreen()
                                                : MyHomePage(
                                                    id: firebaseUser.uid));
  }
}
