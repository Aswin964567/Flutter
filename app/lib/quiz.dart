import 'package:app/home.dart';
import 'package:app/data/questions.dart';
import 'package:app/question_screen.dart';
import 'package:app/result_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  
  @override
  _QuizState createState() => _QuizState();
}

@override
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }

  }


  @override
  Widget build(context) {
    Widget screenWidget = HomeScreen(switchScreen) ;
        if(activeScreen == 'question-screen'){
            screenWidget =  QuestionScreen(
              onSelectAnswer: chooseAnswer);
        }
          if(activeScreen == 'result-screen'){
            screenWidget =  ResultScreen(chosenAnswers: selectedAnswers,);
          }

        
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screenWidget
      ),
    );
  }
}
