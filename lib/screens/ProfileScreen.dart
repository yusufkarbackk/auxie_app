import 'package:auxie_app/services/AuthServices.dart';
import 'package:flutter/material.dart';
import '../bloc/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/SharedStyle.dart';

class ProfileScreen extends StatelessWidget {
  final String id;

  ProfileScreen(this.id);
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
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Username: ",
                      style: titledText,
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, userState) {
                        if (userState is UserLoaded) {
                          return Text(
                            userState.user.name,
                            style: plainText.copyWith(fontSize: 18),
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Email: ",
                      style: titledText,
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, userState) {
                        if (userState is UserLoaded) {
                          return Text(
                            userState.user.email,
                            style: plainText.copyWith(fontSize: 18),
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Phone Number: ",
                      style: titledText,
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, userState) {
                        if (userState is UserLoaded) {
                          return Text(
                            userState.user.phoneNumber,
                            style: plainText.copyWith(fontSize: 18),
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 26,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 180,
                    height: 40,
                    child: RaisedButton(
                      color: Colors.red[400],
                      onPressed: () async {
                        AuthServices.signOut();
                      },
                      child: Center(
                        child: Text(
                          "Sign Out",
                          style: titledText.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
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
