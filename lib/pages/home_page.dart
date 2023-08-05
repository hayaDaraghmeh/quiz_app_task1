import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool istext = true;
  int score = 0;
  int questionIndex = 0;
  bool showResultPage = false;
  String answer = '';
  List<String> correctAnswers = [
    '7',
    'poland',
    'Duck',
    'Infinite loop',
    'Ctrl - C'
  ];
  List<Map<String, dynamic>> questionsWhithAnswers = [
    {
      'question': 'How many rings are on the Olympic flag?',
      'answers': ['3', '5', '6', '7']
    },
    {
      'question':
          'Which of these countries was NOT a part of the Soviet Union?',
      'answers': ['poland', 'Belarus', 'Ukraine', 'Georgia']
    },
    {
      'question': 'Which One Doe not Belong Animals ?',
      'answers': ['Dog', 'Sheep', 'Horse', 'Duck']
    },
    {
      'question': 'A loop that never ends is referred to as a(n)',
      'answers': ['While loop', 'Infinite loop', 'Recursive loop', 'for loop']
    },
    {
      'question': 'Which command will stop an infinite loop?',
      'answers': ['Alt - C', 'Shift - C', 'Esc', 'Ctrl - C']
    }
  ];
  @override
  Widget build(BuildContext context) {
    final questionsWithAnswer = questionsWhithAnswers[questionIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        backgroundColor: Color.fromARGB(255, 255, 241, 111),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (showResultPage == false) ...[
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    questionsWithAnswer['question'],
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: 'Pangolin',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  for (int i = 0;
                      i < questionsWithAnswer['answers'].length;
                      i++)
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 241, 111),
                            side: BorderSide(color: Colors.brown, width: 1.5),
                          ),
                          onPressed: () {
                            setState(() {
                              if (questionIndex <
                                  questionsWhithAnswers.length - 1) {
                                answer = questionsWithAnswer['answers'][i];
                                if (questionsWithAnswer['answers'][i] ==
                                    correctAnswers[questionIndex]) {
                                  score++;
                                }
                                questionIndex++;
                              } else {
                                showResultPage = true;
                              }
                            });
                          },
                          child: Text(
                            questionsWithAnswer['answers'][i],
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 21, 6, 6)),
                          ),
                        ),
                      ),
                    ),
                ],
                if (showResultPage == true) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (score + 1 >= 3) ...[
                          const SizedBox(
                            width: 100,
                            height: 100,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/congratulations.png'),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            'CONGRATULATIONS!',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.green,
                                fontSize: 30,
                                fontFamily: 'LuckiestGuy'),
                          ),
                          const Text(
                            'Your Score is',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 234, 166, 64),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '${score + 1}/${questionsWhithAnswers.length}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.orange,
                                fontSize: 40,
                                fontFamily: 'LuckiestGuy'),
                          ),
                        ],
                        if (score + 1 < 3) ...[
                          const SizedBox(
                            width: 100,
                            height: 100,
                            child: Image(
                              image: AssetImage('assets/images/sad.png'),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            'Hard Luck',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.red,
                                fontSize: 30,
                                fontFamily: 'LuckiestGuy'),
                          ),
                          const Text(
                            'Your Score is',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '${score + 1}/${questionsWhithAnswers.length}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                                fontSize: 40,
                                fontFamily: 'LuckiestGuy'),
                          ),
                        ]
                      ],
                    ),
                  ),
                ]
              ]),
        ),
      ),
    );
  }
}
