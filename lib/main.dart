import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext contect) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List<Map> allQuestions = [
    {
      "question": "who is The Founder of Microsoft",
      "Options": ["Steve jobs", "Bill gets", "Lary Page", "Elon Musk"],
      "correctAnswer": 1
    },
    {
      "question": "who is The Founder of Google",
      "Options": ["Steve jobs", "Bill gets", "Lary Page", "Elon Musk"],
      "correctAnswer": 2
    },
    {
      "question": "who is The Founder of SpaceX",
      "Options": ["Steve jobs", "Bill gets", "Lary Page", "Elon Musk"],
      "correctAnswer": 3
    },
    {
      "question": "who is The Founder of Apple",
      "Options": ["Steve jobs", "Bill gets", "Lary Page", "Elon Musk"],
      "correctAnswer": 0
    },
    {
      "question": "who is The Founder of meta",
      "Options": ["Steve jobs", "Mark ZukerBurg", "Lary Page", "Elon Musk"],
      "correctAnswer": 1
    },
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  int score = 0; 
  bool QuestionPage = true;

  WidgetStateProperty<Color?> checkAnswer(int AnswerIndex) {
    if (selectedAnswerIndex != -1) {
      if (AnswerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == AnswerIndex) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }

  Scaffold isQuestionScreen() {
    if (QuestionPage == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            // qustion number
            Row(
              children: [
                const SizedBox(
                  width: 130,
                ),
                Text(
                  "Question: ${currentQuestionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),

            /// Qustions
            SizedBox(
              width: 380,
              height: 50,
              child: Text(
                allQuestions[currentQuestionIndex]["question"],
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            /// option 1
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(0),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 0;
                    setState(() {});
                  }
                },
                child: Text(
                  "A.${allQuestions[currentQuestionIndex]['Options'][0]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            /// option 2
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(1),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 1;
                    setState(() {});
                  }
                },
                child: Text(
                  "B.${allQuestions[currentQuestionIndex]['Options'][1]}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),const SizedBox(
              height: 20,
            ),

            /// option 3
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(2),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 2;
                    setState(() {});
                  }
                },
                child: Text(
                  "C.${allQuestions[currentQuestionIndex]['Options'][2]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),const SizedBox(
              height: 20,
            ),

            /// option 4
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(3),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 3;
                    setState(() {});
                  }
                },
                child: Text(
                  "D.${allQuestions[currentQuestionIndex]['Options'][3]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedAnswerIndex != -1) {
              /// Update the score if the answer is correct
              if (selectedAnswerIndex ==
                  allQuestions[currentQuestionIndex]["correctAnswer"]) {
                score++;
              }

              /// this checks the condition and shows the results screen
              if (currentQuestionIndex < allQuestions.length - 1) {
                currentQuestionIndex++;
              } else {
                QuestionPage = false;
              }
              selectedAnswerIndex = -1;
              setState(() {});
            }
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz Results",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://tse3.mm.bing.net/th?id=OIP.lfHu-jh9r3dJvWLvKw1dbAHaG3&pid=Api&P=0&h=180",
                height: 300,
              ),
              const SizedBox(height: 30),
              const Text(
                "Congratulations",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.orange),
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Score: $score/${allQuestions.length}"), // Display score
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  // Reset quiz
                  setState(() {
                    currentQuestionIndex = 0;
                    score = 0;
                    QuestionPage = true;
                  });
                },
                child: const Text("Reset Quiz"),
                
              ),
            ],
          ),
        ),
      );
    }
  }
}
