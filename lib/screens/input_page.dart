import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/buttom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/constents.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = KInactivecardcolor;
  Color femaleCardColor = KInactivecardcolor;
  Gender SelectedGender;
  int height = 160;
  int weight = 30;
  int age = 10;

//  void updateColor(Gender gender) {
//    if (gender == Gender.male) {
//      maleCardColor = activecardcolor;
//      femaleCardColor = inactivecardcolor;
//    } else if (gender == Gender.female) {
//      femaleCardColor = activecardcolor;
//      maleCardColor = inactivecardcolor;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusablecard(
                    onPressed: () {
                      setState(() {
                        SelectedGender = Gender.male;
                      });
                    },
                    cardChild:
                        cardcontent(icon: FontAwesomeIcons.mars, lable: 'Male'),
                    color: SelectedGender == Gender.male
                        ? KActivecardcolor
                        : KInactivecardcolor,
                  ),
                ),
                Expanded(
                  child: Reusablecard(
                    onPressed: () {
                      setState(() {
                        SelectedGender = Gender.female;
                      });
                    },
                    cardChild: cardcontent(
                        icon: FontAwesomeIcons.venus, lable: 'Female'),
                    color: SelectedGender == Gender.female
                        ? KActivecardcolor
                        : KInactivecardcolor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusablecard(
              color: KActivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Height', style: KLabletextstyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: KValuestyle,
                      ),
                      Text(
                        'cm',
                        style: KLabletextstyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: KBottomcontainerColor,
                      overlayColor: Color(0X29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white12,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      //label: '$height',
                      //activeColor: KBottomcontainerColor,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusablecard(
                    color: KActivecardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: KLabletextstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KValuestyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                state: () {
                                  setState(() {
                                    weight = weight - 1;
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              state: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusablecard(
                    color: KActivecardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: KLabletextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: KValuestyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                state: () {
                                  setState(() {
                                    age = age - 1;
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                state: () {
                                  setState(() {
                                    age = age + 1;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              child: ButtomButton(
            onTap: () {
              Calculator_brain calc =
                  Calculator_brain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      interpretation: calc.getInterpretation(),
                      bmiResult: calc.calcBmi(),
                      resultText: calc.getResult()),
                ),
              );
            },
            text: 'Calculate',
          )),
        ],
      ),
    );
  }
}
