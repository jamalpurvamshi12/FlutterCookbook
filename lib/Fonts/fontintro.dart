import 'package:flutter/material.dart';


class FontIntro extends StatelessWidget
{
  static const String id='fontintro';
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Image(
                height: 140,
                image:AssetImage('images/211.jpg'),
              ),

              Container
                (
                margin:EdgeInsets.symmetric(vertical: 10.0,horizontal: 85.0),
                child:
                Text('Jamalpur Vamshi',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 85.0),
                child:Text('Flutter Developer',
                    style: TextStyle(
                      fontSize: 29,
                      fontFamily: 'SourceSansPro-ExtraLight',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    )),
              ),


              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.teal,

                      ),

                      SizedBox(
                        width: 8,
                      ),

                      Text('+91 99999999',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),

                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                color: Colors.white,

              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.email_outlined,
                        color:Colors.teal,
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Text("vamshivj12@gmail.com",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.teal,
                        ) ,)
                    ],
                  ),
                ),

                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                color: Colors.white,
              )
            ],
          ),

        ),
      ),
    );
  }
}



