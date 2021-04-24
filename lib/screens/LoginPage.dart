import 'package:flutter/material.dart';
import '../services/AuthServices.dart';
import '../shared/SharedStyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/page_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flushbar/flushbar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSignIn = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToSplashPage());
          return;
        },
        child: Container(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.10),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(bottom: 80),
                  child: Text("Welcome To Auxie",
                      style: titledText.copyWith(fontSize: 28)),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.50,
                    decoration: BoxDecoration(
                        color: auxieBlue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          child: TextField(
                            onChanged: (text) {
                              setState(() {
                                isEmailValid = EmailValidator.validate(text);
                              });
                            },
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(Icons.email_rounded),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: TextField(
                            onChanged: (text) {
                              setState(() {
                                isPasswordValid = text.length >= 6;
                              });
                            },
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          child: isSignIn
                              ? CircularProgressIndicator()
                              : FloatingActionButton(
                                  child: Icon(Icons.arrow_forward,
                                      color: isEmailValid && isPasswordValid
                                          ? Colors.white
                                          : Color(0xFFBEBEBE)),
                                  backgroundColor:
                                      isEmailValid && isPasswordValid
                                          ? auxieOrange
                                          : Color(0xFFE4E4E4),
                                  onPressed: isEmailValid && isPasswordValid
                                      ? () async {
                                          setState(() {
                                            isSignIn = true;
                                          });
                                          SignInSignUpResult result =
                                              await AuthServices.signIn(
                                                  emailController.text,
                                                  passwordController.text);

                                          if (result.hasil == null) {
                                            print(result.message);
                                            setState(() {
                                              isSignIn = false;
                                            });
                                            
                                            Flushbar(
                                              duration: Duration(seconds: 4),
                                              flushbarPosition:
                                                  FlushbarPosition.TOP,
                                              backgroundColor:
                                                  Color(0xFFFF5C83),
                                              message: result.message,
                                            )..show(context);
                                          } else {
                                            print(result.hasil);
                                          }
                                        }
                                      : null,
                                ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
