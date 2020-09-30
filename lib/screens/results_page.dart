import 'file:///F:/bmi-calculator-flutter/lib/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/constents.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/buttom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

Calculator_brain calculator_brain = new Calculator_brain();
int height = height;

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: KLargeTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusablecard(
              color: KActivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: KResultText,
                  ),
                  Text(bmiResult, style: KResultValue),
                  Text(
                    interpretation,
                    style: KAdviceText,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: ButtomButton(
              text: 'Re-Calculate',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
