import 'package:flutter/material.dart';
import '../services/AuthServices.dart';
import '../shared/SharedStyle.dart';
import '../models/User.dart';
import '../bloc/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: auxieBlue,
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Create Your Auxie Account",
                        style: titledText.copyWith(
                            color: Colors.white, fontSize: 28)),
                    Container(
                      child: Column(
                        children: [
                          TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                                hintText: "Username",
                                prefixIcon: Icon(Icons.person),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: "Emailr",
                                prefixIcon: Icon(Icons.email_rounded),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                                hintText: "Phone Number",
                                prefixIcon: Icon(Icons.phone),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: 200,
                            height: 50,
                            child: RaisedButton(
                              onPressed: () async {
                                SignInSignUpResult result =
                                    await AuthServices.signUp(
                                        usernameController.text,
                                        emailController.text,
                                        phoneNumberController.text,
                                        passwordController.text);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
