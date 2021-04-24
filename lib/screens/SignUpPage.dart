import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../services/AuthServices.dart';
import '../shared/SharedStyle.dart';
import '../models/User.dart';
import '../bloc/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flushbar/flushbar.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isUsernameValid = false;
  bool isPhoneNumberValid = false;
  bool isSignUp = false;
  @override
  Widget build(BuildContext context) {
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
                            onChanged: (text) {
                              setState(() {
                                isUsernameValid = text.isNotEmpty;
                              });
                            },
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
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.number,
                            onChanged: (text) {
                              setState(() {
                                isPhoneNumberValid = text.length == 12;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              prefixIcon: Icon(Icons.phone),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            onChanged: (text) {
                              setState(() {
                                isPasswordValid = text.length >= 6;
                              });
                            },
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
                          isSignUp
                              ? CircularProgressIndicator()
                              : Container(
                                  width: 200,
                                  height: 50,
                                  child: RaisedButton(
                                    onPressed: () async {
                                      if (isUsernameValid != true &&
                                          isEmailValid != true &&
                                          isPhoneNumberValid != true &&
                                          isPasswordValid != true) {
                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Color(0xFFFF5C83),
                                          message: "Please Fill All the Fields",
                                        )..show(context);
                                      } else if (isUsernameValid != true) {
                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Color(0xFFFF5C83),
                                          message:
                                              "Please Fill the Username Field",
                                        )..show(context);
                                      } else if (isEmailValid != true) {
                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Color(0xFFFF5C83),
                                          message:
                                              "Please Fill the Email Field",
                                        )..show(context);
                                      } else if (isPhoneNumberValid != true) {
                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Color(0xFFFF5C83),
                                          message:
                                              "please Fill the Phone Number Field",
                                        )..show(context);
                                      } else if (isPasswordValid != true) {
                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Color(0xFFFF5C83),
                                          message:
                                              "Please Fill the Password Field with 6 or More Characters",
                                        )..show(context);
                                      } else {
                                        setState(() {
                                          isSignUp = true;
                                        });
                                        SignInSignUpResult result =
                                            await AuthServices.signUp(
                                                usernameController.text,
                                                emailController.text,
                                                phoneNumberController.text,
                                                passwordController.text);

                                        if (result.user == null) {
                                          setState(() {
                                            isSignUp = false;
                                          });
                                          Flushbar(
                                            duration: Duration(seconds: 4),
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                            backgroundColor: Color(0xFFFF5C83),
                                            message: result.message,
                                          )..show(context);
                                        } else {
                                          return null;
                                        }
                                      }
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
