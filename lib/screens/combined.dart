import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Fonts/fontintro.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class Listele extends StatefulWidget
{
  static const String id='combined';
  @override
  _ListeleState createState() => _ListeleState();
}

class _ListeleState extends State<Listele> {
  @override
  Widget build(BuildContext context) {
    var controller;
    return  Scaffold(
      backgroundColor: Colors.red.withOpacity(controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                ColorizeAnimatedTextKit(
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red ],

                  text:['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'log in',
              onPressed:()
              {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: Colors.lightBlue,
            ),
            RoundedButton(
              title: 'Register',
              onPressed:()
              {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              color: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {

  RoundedButton({@required this.title,@required this.onPressed,@required this.color});

  final String title;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
