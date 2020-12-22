import 'package:flutter/material.dart';

class IconContent extends StatelessWidget
{
  const IconContent({this.icon,this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 100,
        ),

        SizedBox(
          height: 10,
        ),

        Text(label,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
