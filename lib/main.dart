import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

quiz_brain myBrain = quiz_brain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  // extends is implementing inheritance
  @override // this is implementing polymorphism//
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> Score = [];

  void checkAns(bool userAns) {
    bool correctAns = myBrain.getAnswer();

    setState(() {
      if (myBrain.isFinished() == true) {
        Alert(context: context, title: "Finished !!", desc: "You have done it.")
            .show();

        myBrain.reset();

        Score = [];
      } else {
        if (correctAns == userAns) {
          Score.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        }
        else {
          Score.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
          myBrain.nextQue();
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // now below line is unable to access the private question bank
                // instead
                // myBrain.QuestionBank[ind].questionText,
                myBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAns(true); // the user picked true
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAns(false); //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: Score,
        )
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}
