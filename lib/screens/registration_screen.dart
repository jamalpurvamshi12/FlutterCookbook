import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import 'chat_screen.dart';
import 'package:validators/validators.dart';
import 'welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget
{
  static const String id="registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
{
  final _formKey = GlobalKey<FormState>();
 final _auth=FirebaseAuth.instance;
  bool showSpinner=false;
  String email;
  String password;

  @override
  Widget build(BuildContext context)
  {
    return Form(
      key: _formKey,
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
                TextFormField(
                 validator: (value)
                  {
                  if (value.isEmpty) {
                  return 'Please enter some text';
                  }
                  return null;
                  },
                  keyboardType: TextInputType.emailAddress,
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
                TextFormField(
                  validator: (value)
                  {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  textAlign:TextAlign.center,
                  obscureText: true,
                  onChanged: (value)
                  {
                    password=value;

                  },
                  decoration: InputDecoration().copyWith(hintText: 'enter your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(title: 'Register', onPressed: () async
                {

                  print(email);
                  print(password);

                  try
                      {
                        final newUser=await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        if(newUser!=null)
                          {
                            SharedPreferences prefs=await SharedPreferences.getInstance();
                            prefs.setString('email',email);
                            kemail=email;
                            Navigator.pushNamed(context, ChatScreen.id);
                          }


                      }
                      catch(e)
                  {
                    print("wrong");
                  }
                }, color: Colors.lightBlueAccent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
