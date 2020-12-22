import 'package:flutter/material.dart';
import 'Calculation_task.dart';
import 'bottombutton.dart';
import 'reusable_card.dart';
import 'constants.dart';


class Screen2 extends StatelessWidget {
  Screen2({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Result'),
        backgroundColor: Color(0xFF1D1E33),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

         Expanded(
             child: Text('YOUR RESULT',
                    style:kresultstyleheading,
                    ),),

         Expanded(
           flex: 5,
             child: Container(
               child:Reusable_card(
               colour: inactive_card_color,
               cardChild: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                 children: <Widget>[
                   Container(
                     child: Text(resultText.toUpperCase(),
                           style: TextStyle(
                                fontSize: 50,
                                color: Colors.green,
                                    ),

                      ),
                   ),

                   Container(
                     child: Text(bmiResult,style: kresultstyle,),
                   ),

                   Container(
                     child: Text(interpretation
                       ,style: kresultstylelast,
                     ),
                   ),
                 ],
               ),
             ),),
         ),

    BottomButton(
    ontap:()
    {
    Navigator.pop(context);
    },
  text: "RE-CALCULATE",
    ),
        ],
    ),
    );
  }
}
