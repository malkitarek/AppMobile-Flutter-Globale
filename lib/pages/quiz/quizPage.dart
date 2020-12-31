import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int score = 0;
  var quiz = [
    {
      "title": "Question 1",
      "answers": [
        {"answer": "Answer 11", "correct": false},
        {"answer": "Answer 12", "correct": true},
        {"answer": "Answer 13", "correct": false}
      ]
    },
    {
      "title": "Question 2",
      "answers": [
        {"answer": "Answer 21", "correct": false},
        {"answer": "Answer 22", "correct": true},
        {"answer": "Answer 23", "correct": false}
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz Page"),
        ),
        body: (currentQuestion >= quiz.length)
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Score ${(score / quiz.length) * 100}%",
                    style: TextStyle(fontSize: 22, color: Colors.deepOrange),
                  ),
                  MaterialButton(
                      color: Colors.deepOrange,
                      child: Text(
                        "Restart...",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          currentQuestion = 0;
                          score = 0;
                        });
                      })
                ],
              ))
            : ListView(
                children: [
                  ListTile(
                      title: Center(
                          child: Text(
                              "Question ${currentQuestion + 1}/${quiz.length}",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold)))),
                  ListTile(
                    title: Text(
                      quiz[currentQuestion]["title"],
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...(quiz[currentQuestion]["answers"]
                          as List<Map<String, Object>>)
                      .map((a) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: Colors.deepOrange,
                          onPressed: () {
                            setState(() {
                              if (a["correct"] == true) {
                                ++score;
                              }
                              ++currentQuestion;
                            });
                          },
                          child: Text(
                            a["answer"],
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ));
  }
}
