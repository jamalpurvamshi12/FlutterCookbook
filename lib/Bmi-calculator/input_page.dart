import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottombutton.dart';
import 'iconcontent.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'roundicon_button.dart';
import 'Screen2.dart';
import 'Calculation_task.dart';


enum Gender{
  male,female
}

class InputPage extends StatefulWidget
{
  static const String id='input_page';
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>
{
  Gender selected;
  int height=180;
  int weight=80;
  int Age=30;

    @override
    Widget build(BuildContext context) {
      return Scaffold(

        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded
                    (
                    child:
                   Reusable_card(
                     onPress:()
                     {
                       setState(() {
                         selected=Gender.male;
                       });
                     },
                     colour: selected==Gender.male ? active_card_color: inactive_card_color,
                     cardChild: IconContent(
                         icon: FontAwesomeIcons.mars, label: "MALE"),
                   ),
                  ),

                  Expanded
                    (
                    child:
                    Reusable_card
                      (
                      onPress:()
                      {
                        setState(() {
                          selected=Gender.female;
                        });
                      },
                      colour:selected==Gender.female ? active_card_color: inactive_card_color,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, label: "FEMALE"),
                    ),
                  ),
                ],
              ),
            ),


            Expanded(
              child: Reusable_card
                (
                colour: Color(0xFF1D1E33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text('HEIGHT',style: ktextstyle
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),style:klabelstyle
                        ),
                        Text('cm',style: TextStyle(fontSize:30),
                        ),
                      ],
                    ),

                 SliderTheme(
                   data: SliderTheme.of(context).copyWith(
                     inactiveTrackColor:Colors.white,
                     activeTrackColor: active_card_color,
                     thumbColor:active_card_color,

                     thumbShape:
                     RoundSliderThumbShape(enabledThumbRadius: 15),
                     overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30),

                   ),
                   child: Slider(
                     value: height.toDouble(),

                       onChanged: (double newValue)
                     {
                       setState(()
                       {
                         height=newValue.round();
                       });
                     },
                       min: 30,
                       max: 300,
                   ),
                 ),

                  ],
                ),
              ),

            ),

            Expanded
              (
              child: Row(
                children: <Widget>[

                  Expanded
                    (
                    child:
                    Reusable_card(
                      colour: Color(0xFF1D1E33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('weight',
                          style: ktextstyle,
                          ),

                          Text(weight.toString(),
                            style: klabelstyle,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: ()
                            {
                              setState(() {
                                weight++;
                              });
                            },

                          ),

                         SizedBox(
                           width: 20,
                         ),

                         RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                           onPressed: ()
                           {
                             setState(() {
                               weight--;
                             });
                           },
                         ),
                              ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded
                    (
                    child:
                    Reusable_card(
                      colour: Color(0xFF1D1E33),
                      cardChild:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text('Age',
                        style: ktextstyle,
                      ),

                        Text(Age.toString(),
                          style: klabelstyle,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                        RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                          onPressed: ()
                          {
                            setState(() {
                              Age++;
                            });
                          },
                        ),

                            SizedBox(
                              width: 20,
                            ),

                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: ()
                              {
                                setState(() {
                                  Age--;
                                });
                              },
                            ),
                          ],
                        ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

           BottomButton(
              ontap:()
            {
              CalculationBrain cb=CalculationBrain(height: height,weight: weight);
              Navigator.push(context,
            MaterialPageRoute(builder: (context) =>Screen2(
            bmiResult: cb.CalculatorBMI(),resultText: cb.getresult(),interpretation:cb.getInterpretation(),
            )));
             },
             text: "CALCULATE",
      ),

          ],
        ),
      );
    }
  }


