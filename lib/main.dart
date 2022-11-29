import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> score = [];
  List<String> question = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];
  List<bool> answer = [false, true, true];

  var num = 0;
  var turn = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                question[num],
                textAlign: TextAlign.center,
                style: const TextStyle(
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
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                if (question.length != turn) {
                  setState(() {
                    if (answer[num] == true) {
                      score.add(const Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    } else {
                      score.add(const Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    if (num != 2) {
                      num++;
                    }
                    turn++;
                  });
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (question.length != turn) {
                  setState(() {
                    if (answer[num] == false) {
                      score.add(const Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    } else {
                      score.add(const Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    if (num != 2) {
                      num++;
                    }
                    turn++;
                  });
                }
              },
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}
