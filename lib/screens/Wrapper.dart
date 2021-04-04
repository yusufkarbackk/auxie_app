import 'package:auxie_app/bloc/page_bloc.dart';
import '../screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../screens/LoginPage.dart';
import 'SplashPage.dart';
import 'SignUpPage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);

    if (firebaseUser == null) {
      context.bloc<PageBloc>().add(GoToSplashPage());
    } else {
      context.bloc<PageBloc>().add(GoToMainPage());
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnSignUpPage)
                ? SignUpPage()
                : (pageState is OnSignInPage)
                    ? LoginPage()
                    : MyHomePage());
  }
}
