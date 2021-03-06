import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/Bmi-calculator/input_page.dart';
import 'package:flash_chat/Fonts/fontintro.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget
{

  static const String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin
{
  AnimationController controller;

  @override
  void initState() {
    controller=AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();

    controller.addListener(()
    {
      setState(() {

      });
      print(controller.value);
    }
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(controller.value),
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
                    fontFamily: 'Pacifico',
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

      RoundedButton(
        title: 'Bio',
        onPressed:()
        {
          Navigator.pushNamed(context, FontIntro.id);
        },
        color: Colors.lightBlue,
      ),

      RoundedButton(
        title: 'BMI',
        onPressed:()
        {
          Navigator.pushNamed(context, InputPage.id);
        },
        color: Colors.lightBlue,
      ),
          ],
        )
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
