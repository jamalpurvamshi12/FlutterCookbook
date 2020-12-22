import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constants.dart';
import 'chat_screen.dart';
import 'chat_screen.dart';
import 'welcome_screen.dart';

class LoginScreen extends StatefulWidget
{
  static const String id="login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{

  final _auth=FirebaseAuth.instance;
  bool showSpinner=false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(

        backgroundColor: Colors.brown,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                    textAlign:TextAlign.center,
                  onChanged: (value)
                  {
                    email=value;
                    //Do something with the user input.
                  },

                  decoration: InputDecoration().copyWith(hintText: 'enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign:TextAlign.center,
                  obscureText: true,
                  onChanged: (value)
                  {
                    password=value;
                    //Do something with the user input.
                  },
                  decoration: InputDecoration().copyWith(hintText: 'enter your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(title: 'log in', onPressed: () async
                {

                  setState(() {
                    showSpinner=true;
                  });

                  try
                      {
                        final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(user!=null)
                          {
                            kemail=email;
                            Navigator.pushNamed(context, ChatScreen.id);

                          }

                        setState(() {
                          showSpinner=false;
                        });

                      }


                      catch(e)
                  {
                    setState(() {
                      showSpinner=false;
                    });

                    print("wrong");
                  }




                }, color: Colors.lightBlueAccent)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
