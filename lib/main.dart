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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:
          size.width <= 800 ? Colors.blue.shade300 : Colors.green.shade300,
      appBar: AppBar(
        backgroundColor:
            size.width <= 800 ? Colors.blue : Colors.green.shade500,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LayoutBuilder(builder: (context, constraints) {
                // if we are on a SMALL screen display content in a column
                if (size.width <= 800) {
                  // Display questions and answers in column format for small screens
                  return SizedBox(
                    width: double.infinity,
                    // color: Colors.blue.shade600,
                    child: Column(
                      children: [
                        QuestionColumn(
                          question: questions[0],
                          constraints: constraints,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionColumn(
                          question: questions[1],
                          constraints: constraints,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionColumn(
                          question: questions[2],
                          constraints: constraints,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionColumn(
                          question: questions[0],
                          constraints: constraints,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionColumn(
                          question: questions[1],
                          constraints: constraints,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionColumn(
                          question: questions[2],
                          constraints: constraints,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                } else {
                  // if we are on a BIG screen, display content in a row
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Column(
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
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionRow(question: questions[0]),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionRow(question: questions[1]),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionRow(question: questions[2]),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionRow(question: questions[0]),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionRow(question: questions[1]),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionRow(question: questions[2]),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionRow(question: questions[0]),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionRow(question: questions[1]),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionRow(question: questions[2]),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionColumn extends StatelessWidget {
  const QuestionColumn({
    super.key,
    required this.question,
    required this.constraints,
    required this.color,
  });

  final Question question;
  final BoxConstraints constraints;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      // color: Colors.red,
      width: constraints.maxWidth * 0.8,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            question.question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            clipBehavior: Clip.antiAlias,
            height: 100,
            width: 100,
            child: Image(
                image: AssetImage(question.imageURL),
                alignment: Alignment.center,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill),
          ),
          const SizedBox(
            height: 10,
          ),
          AnswerWidget(
            answer: question.answers[0],
            height: 50.0,
            width: 200.0,
            color: const Color.fromARGB(255, 4, 98, 175),
          ),
          const SizedBox(
            height: 10,
          ),
          AnswerWidget(
            answer: question.answers[1],
            height: 50.0,
            width: 200.0,
            color: const Color.fromARGB(255, 4, 98, 175),
          ),
          const SizedBox(
            height: 10,
          ),
          AnswerWidget(
            answer: question.answers[2],
            height: 50.0,
            width: 200.0,
            color: const Color.fromARGB(255, 4, 98, 175),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
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
          AnswerWidget(
              answer: question.answers[0],
              height: 100.0,
              width: 150.0,
              color: Colors.green.shade800),
          AnswerWidget(
              answer: question.answers[1],
              height: 100.0,
              width: 150.0,
              color: Colors.green.shade800),
          AnswerWidget(
              answer: question.answers[2],
              height: 100.0,
              width: 150.0,
              color: Colors.green.shade800),
        ],
      ),
    );
  }
}

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    super.key,
    required this.answer,
    required this.height,
    required this.width,
    required this.color,
  });

  final String answer;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: color,
        ),
      ),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      height: height,
      width: width,
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
