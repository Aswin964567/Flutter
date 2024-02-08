import 'package:app/data/questions.dart';
// import 'package:app/home.dart';
import 'package:app/question_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key,
   required this.chosenAnswers
   }
   );

  final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question':questions[i].text,
         'correct_answer': questions[i].answers[0],
         'user_answer':chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context){
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Container(
      width: double.infinity,
      height: double.infinity,
       decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 35, 12, 26), Color(0xFF6713D2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
      child: Container(
        margin: const EdgeInsets.all(40),
       
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!'),
            const SizedBox(
              height: 30,),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,),
            TextButton(onPressed:(){
              
            } , 
            child: const Text('Restart Quiz')
            )
          ],
        ),
      ),
    );
  }
}
