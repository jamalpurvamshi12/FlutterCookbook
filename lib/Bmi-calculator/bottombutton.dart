import 'package:flutter/material.dart';
import 'Calculation_task.dart';
import 'Screen2.dart';

class BottomButton extends StatelessWidget
{
  BottomButton({@required this.ontap,@required this.text});

  final Function ontap;
  final String text;

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap:ontap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 5,bottom: 10),
        height: 60,
        width: double.infinity,
        child: Text(text,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
          ),),
        color: Colors.pinkAccent,
      ),
    );
  }
}
