import 'dart:ui';

import 'package:flutter/material.dart';
import '../config/palette.dart';
class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);
  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}


class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool isSignupScreen = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0, left: 0, right: 0,
              child: Container( // Box of green background
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                  child:
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 90, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(text: TextSpan(
                              text: 'Welcome',
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25,
                                  color: Colors.white
                              ),
                              children: [
                                TextSpan(
                                    text: isSignupScreen
                                        ?' to EOS Chat'
                                        :' back',
                                    style: TextStyle(
                                        letterSpacing: 1.0,
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    )
                                )
                              ]
                          )),
                          
                          SizedBox(
                            height: 5.0,
                          ),
                          Text( isSignupScreen
                              ? 'Sign up to continue'
                              : 'Sign in to continue',
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.white
                              )
                          ),
                        ],
                      )
                  )
              ) ),

          Positioned( // Box of LOGIN and SIGN UP
            top: 180,
              child: AnimatedContainer( // Size of Box
                height: isSignupScreen
                    ? 330.0
                    : 280.0,
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow (
                      color: Colors.black.withOpacity(0.3),blurRadius: 15, spreadRadius: 5
                    )
                  ]
                ),
                duration: const Duration(milliseconds: 500,),
                curve: Curves.easeIn,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector( // GestureDetector of Login
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1 ),
                              ),
                              if (!isSignupScreen) //SignupScreen이 false 일때
                                Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.green
                                )
                            ],
                          ),
                        ),
                        GestureDetector( // GestureDetector of Sign up
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'SIGN UP',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen) //SignupScreen이 true 일때
                              Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.green,
                              )
                            ] ,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField( // Login: email, Sign up: Username
                                decoration: InputDecoration(
                                  hintText: isSignupScreen ? 'Username' : 'Email',
                                  prefixIcon: Icon(
                                      isSignupScreen
                                          ? Icons.account_circle
                                          : Icons.mail,
                                      color: Palette.iconColor),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.circular(35.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0))
                                  ),
                                )
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField( // Login: password, Sign up: email
                                decoration: InputDecoration(
                                  hintText: isSignupScreen ? 'Email' : 'Password',
                                  prefixIcon: Icon(
                                      isSignupScreen
                                          ? Icons.email
                                          : Icons.lock,
                                      color: Palette.iconColor),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.circular(35.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0))
                                  ),
                                )
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            if(isSignupScreen) // Using only Sign up screen, password slot
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock,
                                      color: Palette.iconColor),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.circular(35.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Palette.textColor1),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0))
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          AnimatedPositioned( // Arrow button under login and sign up box
            top: isSignupScreen
                ? 460
                : 410,
            right: 0,
            left: 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15.0), height: 90, width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.lightGreen, Colors.green],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1)
                          )
                        ]
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    )
                  )
              ),
          ),
          Positioned( // Box of Google button and text
              top: MediaQuery.of(context).size.height - 125, right: 0, left: 0,
              child: Column(
                children: [
                  Text( isSignupScreen
                      ? "or Sign up with"
                      : "or Sign in with"
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(155, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        backgroundColor: Palette.googleColor,
                      ),
                    icon: Icon(Icons.add),
                    label: Text("Google"),
                  )
                ],
              )
          )
        ],
      )
    );
  }
  
}