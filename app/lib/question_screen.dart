import 'package:app/answer_button.dart';
import 'package:app/data/questions.dart';
import 'package:flutter/material.dart';
// import 'package:app/models/quiz_questions.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key,required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;


  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
 var currentQuestionIndex = 0;

 void answerQuestion(String selectedAnswer){
   widget.onSelectAnswer(selectedAnswer);
   setState(() {
       currentQuestionIndex++;
   });
 }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    
    return  Container(
      
      width: double.infinity,
      decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 35, 12, 26), Color(0xFF6713D2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
            Text(
            currentQuestion.text,
           style:GoogleFonts.lato(
            color: const Color.fromARGB(255, 239, 6, 126),
            fontSize: 24,
            fontWeight: FontWeight.bold
           ),
           textAlign: TextAlign.center,
           ),
           const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer){
            return AnswerButton(answerText: answer,
             onTap: (){
              answerQuestion(answer);
            });
           }),
          
          ],
                ),
        ),
    );
  }
}