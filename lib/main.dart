import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dean\'s Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dean\'s Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Question> questions = [
    Question(
        question: 'What does RGB refer to?',
        category: 'IT',
        imageURL: 'assets/rgb.png',
        answers: ['Red/Green/Blue', 'Raid Shadow Legends', 'Ice Cream'],
        correctAnswer: 'Red/Green/Blue'),
    Question(
        question: 'What device is this?',
        category: 'IT',
        imageURL: 'assets/printer.jpg',
        answers: ['First Telephone', 'Fax Machine', '3D Printer'],
        correctAnswer: '3D Printer'),
    Question(
        question: 'How much liter of water should an adult female drink daily?',
        category: 'IT',
        imageURL: 'assets/water.jpg',
        answers: ['2.8L', '4L', '1L'],
        correctAnswer: '2.8L'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LayoutBuilder(builder: (context, constraints) {
              final size = MediaQuery.of(context).size;

              // if we are on a SMALL screen display content in a column
              if (size.width <= 420 && size.height <= 720) {
                return Container(
                  color: Colors.green.shade400,
                  width: 200,
                  height: 100,
                  child: const Center(
                    child: Text('This is a small screen'),
                  ),
                );
              } else {
                // if we are on a BIG screen, display content in a row
                return Column(
                  children: [
                    QuestionRow(question: questions[0]),
                    const SizedBox(
                      height: 20,
                    ),
                    QuestionRow(question: questions[1]),
                    const SizedBox(
                      height: 20,
                    ),
                    QuestionRow(question: questions[2]),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

class QuestionRow extends StatelessWidget {
  const QuestionRow({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade400,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            height: 100,
            width: 100,
            child: Image(
              image: AssetImage(question.imageURL),
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: Text(
                  question.question,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green.shade900),
                )),
          ),
          AnswerWidget(answer: question.answers[0]),
          AnswerWidget(answer: question.answers[1]),
          AnswerWidget(answer: question.answers[2]),
        ],
      ),
    );
  }
}

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    super.key,
    required this.answer,
  });

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.green.shade800,
        ),
      ),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      height: 100,
      width: 150,
      child: Center(
        child: Text(
          answer,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class Question {
  String question;
  String category;
  String imageURL;
  List<String> answers;
  String correctAnswer;

  Question(
      {required this.question,
      required this.category,
      required this.imageURL,
      required this.answers,
      required this.correctAnswer});
}
