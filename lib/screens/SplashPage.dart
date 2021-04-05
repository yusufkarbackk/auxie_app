import 'package:auxie_app/bloc/page_bloc.dart';
import 'package:auxie_app/models/RegistrationData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/SharedStyle.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return Scaffold(
      backgroundColor: auxieBlue,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Welcome To Auxie",
                      style: titledText.copyWith(
                          fontSize: 28, color: Colors.white),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 200,
                            height: 50,
                            child: RaisedButton(
                              onPressed: () {
                                context.bloc<PageBloc>().add(GoToSignInPage());
                              },
                              color: auxieOrange,
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: plainText.copyWith(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: 200,
                            height: 50,
                            child: RaisedButton(
                              onPressed: () {
                                context.bloc<PageBloc>().add(GoToSignUpPage());
                                Colors.grey;
                              },
                              color: auxieOrange,
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: plainText.copyWith(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
