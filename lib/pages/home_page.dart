import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool istext = true;
  int score = -1;
  int questionIndex = 0;
  bool showResultPage = false;
  String answer = '';
  int? yourChoiceIndex;
  List<int> youranswers = [];
  List<Map<String, dynamic>> questionsWhithAnswers = [
    {
      'question': 'How many rings are on the Olympic flag?',
      'answers': ['three', 'five', 'six', 'seven'],
      'correctAnswer': 3,
      'icon': [
        'assets/images/three.png',
        'assets/images/five.png',
        'assets/images/six.png',
        'assets/images/seven.png',
      ],
    },
    {
      'question':
          'Which of these countries was NOT a part of the Soviet Union?',
      'answers': ['poland', 'Belarus', 'Ukraine', 'Georgia'],
      'correctAnswer': 0,
      'icon': [
        'assets/images/poland.png',
        'assets/images/Belarus.png',
        'assets/images/georgia.png',
        'assets/images/ukraine.png',
      ],
    },
    {
      'question': 'Which One Dose not Belong Animals ?',
      'answers': ['Dog', 'Sheep', 'Horse', 'Duck'],
      'correctAnswer': 3,
      'icon': [
        'assets/images/pet.png',
        'assets/images/sheep.png',
        'assets/images/horse.png',
        'assets/images/duck.png',
      ],
    },
    {
      'question': 'A loop that never ends is referred to as a(n)',
      'answers': ['While loop', 'Infinite loop', 'Recursive loop', 'for loop'],
      'correctAnswer': 1,
      'icon': [
        'assets/images/while.png',
        'assets/images/infinite.png',
        'assets/images/rec.png',
        'assets/images/for.png',
      ],
    },
    {
      'question': 'Which command will stop an infinite loop?',
      'answers': ['Alt - C', 'Shift - C', 'Esc', 'Ctrl - C'],
      'correctAnswer': 3,
      'icon': [
        'assets/images/alt.png',
        'assets/images/shift.png',
        'assets/images/esc.png',
        'assets/images/ctrl.png',
      ],
    }
  ];
  List<int> yourAnswers = [];

  void resetQuize() {
    setState(() {
      questionIndex = 0;
      showResultPage = false;
      yourChoiceIndex = null;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questionsWithAnswer = questionsWhithAnswers[questionIndex];
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (showResultPage == false) ...[
              SizedBox(
                height: size.height * 0.09,
              ),
              Text(
                questionsWithAnswer['question'],
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                'Answer and get points',
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Step ${questionIndex + 1}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Text(
                    'of ${questionsWhithAnswers.length}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                  ),
                ],
              ),
              LinearProgressIndicator(
                color: const Color.fromARGB(255, 198, 105, 136),
                value: (questionIndex + 1) / questionsWhithAnswers.length,
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              for (int i = 0; i < questionsWithAnswer['answers'].length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        yourChoiceIndex = i;
                        if (yourChoiceIndex ==
                            questionsWhithAnswers[questionIndex]
                                ['correctAnswer']) {}
                      });
                      /*  print('choice =$yourChoiceIndex');
                      print(score);*/
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: i != yourChoiceIndex
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 198, 105, 136),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: const Color.fromARGB(255, 198, 105, 136),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                                image:
                                    AssetImage(questionsWithAnswer['icon'][i])),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Text(
                              questionsWithAnswer['answers'][i],
                              style: TextStyle(
                                  color: i == yourChoiceIndex
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (yourChoiceIndex != null) {
                        if (questionIndex < questionsWhithAnswers.length - 1) {
                          yourAnswers.add(yourChoiceIndex ?? -1);
                          if (yourChoiceIndex ==
                              questionsWhithAnswers[questionIndex]
                                  ['correctAnswer']) score++;
                          yourChoiceIndex = null;
                          questionIndex++;
                        } else {
                          showResultPage = true;
                        }
                      } else {
                        final snackBar = SnackBar(
                          content: const Text('choose an answer please!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                    //  print(yourAnswers.toString());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 198, 105, 136),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )

              /* for (int i = 0; i < questionsWithAnswer['answers'].length; i++)
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
                            fontSize: 20, color: Color.fromARGB(255, 21, 6, 6)),
                      ),
                    ),
                  ),
                ),*/
            ],
            if (showResultPage == true) ...[
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (score + 1 >= 3) ...[
                      const SizedBox(
                        width: 100,
                        height: 100,
                        child: Image(
                          image:
                              AssetImage('assets/images/congratulations.png'),
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
                            fontSize: 25,
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
                      SizedBox(height: 15),
                      TextButton(
                        onPressed: resetQuize,
                        child: Text(
                          'Reset Quize',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      )
                    ],
                    if (score + 1 < 3) ...[
                      Padding(
                        padding: const EdgeInsets.all(60.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                                  fontSize: 25,
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
                            SizedBox(height: 15),
                            TextButton(
                              onPressed: resetQuize,
                              child: Text(
                                'Reset Quize',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            )
                          ],
                        ),
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
