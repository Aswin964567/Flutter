import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  

  @override
  Widget build(BuildContext context) { 
    return Center(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 35, 12, 26), Color(0xFF6713D2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 200,
              ),
              Image.asset(
                'assets/assets/images/quiz-logo.png',
                width: 300,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Learn Flutter the fun way!',
                style: TextStyle(
                    color: Color.fromARGB(255, 242, 239, 243), fontSize: 25),
              ),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton.icon(
                onPressed: startQuiz,
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                label: const Text(
                  'Start Quiz',
                ),
                icon: const Icon(Icons.arrow_right_alt),
              )
            ],
          )
        ),
    );
  }
}
