//
//
// import 'package:circular_countdown_timer/circular_countdown_timer.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';
//
// import 'package:quizapp/model/quiz.dart';
// import 'package:quizapp/view/result_page.dart';
//
//
//
//
// class PlayQuiz extends StatefulWidget {
//   const PlayQuiz({super.key});
//
//   @override
//   State<PlayQuiz> createState() => _PlayQuizState();
// }
//
// class _PlayQuizState extends State<PlayQuiz> {
//   late PageController _controller;
//   late List<String> selectedAnswers;
//   List<Play> selectedQuestions = [];
//   List<bool> correctAnswers = List.filled(10, false); // 10 questions
//   int questionIndex = 0;
//   final int questionDuration = 15; // 15 seconds for each question
//   late CountDownController _timerController;
//
//   DateTime? startTime;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PageController();
//     _timerController = CountDownController();
//     selectedAnswers = List.filled(10, '');
//
//     // Randomly select 10 questions and shuffle them
//     selectedQuestions = getRandomQuestions(10);
//     correctAnswers = List.filled(selectedQuestions.length, false);
//
//     startTime = DateTime.now();
//     startQuestionTimer(); // Start the timer for the first question
//   }
//
//   // Randomly select `count` number of questions and shuffle them
//   List<Play> getRandomQuestions(int count) {
//     List<Play> shuffledQuestions = List.from(questions);
//     shuffledQuestions.shuffle(Random());
//     return shuffledQuestions.take(count).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff2a4bce),
//       body: Stack(
//         children: [
//           PageView.builder(
//             controller: _controller,
//             physics: const NeverScrollableScrollPhysics(), // Disable swiping
//             itemCount: selectedQuestions.length,
//             itemBuilder: (context, index) {
//               return buildQuestionContent(index);
//             },
//           ),
//           // Timer UI - Moved to the left side
//           Positioned(
//             bottom: 20,
//             left: 20,
//             child: CircularCountDownTimer(
//               duration: questionDuration,
//               initialDuration: 0,
//               controller: _timerController,
//               width: 100,
//               height: 100,
//               ringColor: Colors.green[300]!,
//               fillColor: Colors.red[400]!,
//               strokeWidth: 8.0,
//               strokeCap: StrokeCap.round,
//               textStyle: const TextStyle(
//                   fontSize: 24.0,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//               isReverse: true,
//               onComplete: () {
//                 goToNextQuestion(); // Automatically go to the next question
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildQuestionContent(int index) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Question Image
//           Container(
//             height: 200,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(24),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.6),
//                   blurRadius: 10.0,
//                   spreadRadius: 2.0,
//                   offset: const Offset(5.0, 5.0),
//                 ),
//               ],
//               border: Border.all(color: Colors.white, width: 1.5),
//               image: const DecorationImage(
//                 image: AssetImage('assets/images/studydesk.png'),
//                 fit: BoxFit.cover,
//                 filterQuality: FilterQuality.high,
//               ),
//             ),
//             margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
//           ),
//           // Question Text
//           Container(
//             width: double.infinity,
//             margin: const EdgeInsets.only(left: 12.0),
//             child: Text(
//               "Question ${index + 1}/${selectedQuestions.length}",
//               textAlign: TextAlign.start,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 24.0,
//               ),
//             ),
//           ),
//           const Divider(
//             thickness: 2,
//             indent: 10.0,
//             endIndent: 10.0,
//             color: Colors.white,
//           ),
//           const SizedBox(height: 20.0),
//           // Question and Answers
//           Container(
//             width: double.infinity,
//             margin: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: Text(
//               "${selectedQuestions[index].question}",
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 21.0,
//               ),
//               textAlign: TextAlign.start,
//               softWrap: true,
//             ),
//           ),
//           const SizedBox(height: 12.0),
//           // Display options with radio buttons
//           for (int i = 0; i < selectedQuestions[index].answers.length; i++)
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Radio(
//                   fillColor: const MaterialStatePropertyAll<Color>(Colors.amber),
//                   value: selectedQuestions[index].answers.keys.toList()[i],
//                   groupValue: selectedAnswers[index],
//                   onChanged: (String? value) {
//                     setState(() {
//                       selectedAnswers[index] = value!;
//                       correctAnswers[index] =
//                       selectedQuestions[index].answers[value]!;
//                     });
//                   },
//                 ),
//                 Expanded(
//                   child: Text(
//                     selectedQuestions[index].answers.keys.toList()[i],
//                     style: const TextStyle(
//                         fontSize: 18,
//                         color: Colors.amber,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           const Spacer(),
//           // Next Button
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: ElevatedButton(
//                 onPressed: goToNextQuestion,
//                 child: const Text("Next"),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void goToNextQuestion() {
//     if (questionIndex + 1 < selectedQuestions.length) {
//       setState(() {
//         questionIndex++;
//         _controller.animateToPage(
//           questionIndex,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//         _timerController.restart(duration: questionDuration); // Reset timer
//       });
//     } else {
//       int timeTaken = getTime();
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ScoreScreen(correctAnswers, timeTaken),
//         ),
//       );
//     }
//   }
//
//   void startQuestionTimer() {
//     _timerController.start();
//   }
//
//   int getTime() {
//     return DateTime.now().difference(startTime!).inSeconds;
//   }
// }


// import 'package:circular_countdown_timer/circular_countdown_timer.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';
//
// import 'package:quizapp/model/quiz.dart';
// import 'package:quizapp/view/result_page.dart';
//
// class PlayQuiz extends StatefulWidget {
//   final String userEmail; // Add userEmail as a required parameter
//
//   const PlayQuiz({Key? key, required this.userEmail}) : super(key: key); // Initialize userEmail
//
//   @override
//   State<PlayQuiz> createState() => _PlayQuizState();
// }
//
// class _PlayQuizState extends State<PlayQuiz> {
//   late PageController _controller;
//   late List<String> selectedAnswers;
//   List<Play> selectedQuestions = [];
//   List<bool> correctAnswers = List.filled(10, false); // 10 questions
//   int questionIndex = 0;
//   final int questionDuration = 15; // 15 seconds for each question
//   late CountDownController _timerController;
//
//   DateTime? startTime;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PageController();
//     _timerController = CountDownController();
//     selectedAnswers = List.filled(10, '');
//
//     // Randomly select 10 questions and shuffle them
//     selectedQuestions = getRandomQuestions(10);
//     correctAnswers = List.filled(selectedQuestions.length, false);
//
//     startTime = DateTime.now();
//     startQuestionTimer(); // Start the timer for the first question
//   }
//
//   // Randomly select `count` number of questions and shuffle them
//   List<Play> getRandomQuestions(int count) {
//     List<Play> shuffledQuestions = List.from(questions);
//     shuffledQuestions.shuffle(Random());
//     return shuffledQuestions.take(count).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff2a4bce),
//       body: Stack(
//         children: [
//           PageView.builder(
//             controller: _controller,
//             physics: const NeverScrollableScrollPhysics(), // Disable swiping
//             itemCount: selectedQuestions.length,
//             itemBuilder: (context, index) {
//               return buildQuestionContent(index);
//             },
//           ),
//           // Timer UI - Moved to the left side
//           Positioned(
//             bottom: 20,
//             left: 20,
//             child: CircularCountDownTimer(
//               duration: questionDuration,
//               initialDuration: 0,
//               controller: _timerController,
//               width: 100,
//               height: 100,
//               ringColor: Colors.green[300]!,
//               fillColor: Colors.red[400]!,
//               strokeWidth: 8.0,
//               strokeCap: StrokeCap.round,
//               textStyle: const TextStyle(
//                   fontSize: 24.0,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//               isReverse: true,
//               onComplete: () {
//                 goToNextQuestion(); // Automatically go to the next question
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildQuestionContent(int index) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Question Image
//         Container(
//           height: 200,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(24),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.6),
//                 blurRadius: 10.0,
//                 spreadRadius: 2.0,
//                 offset: const Offset(5.0, 5.0),
//               ),
//             ],
//             border: Border.all(color: Colors.white, width: 1.5),
//             image: const DecorationImage(
//               image: AssetImage('assets/images/studydesk.png'),
//               fit: BoxFit.cover,
//               filterQuality: FilterQuality.high,
//             ),
//           ),
//           margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
//         ),
//         // Question Text
//         Container(
//           width: double.infinity,
//           margin: const EdgeInsets.only(left: 12.0),
//           child: Text(
//             "Question ${index + 1}/${selectedQuestions.length}",
//             textAlign: TextAlign.start,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 24.0,
//             ),
//           ),
//         ),
//         const Divider(
//           thickness: 2,
//           indent: 10.0,
//           endIndent: 10.0,
//           color: Colors.white,
//         ),
//         const SizedBox(height: 20.0),
//         // Question and Answers
//         Container(
//           width: double.infinity,
//           margin: const EdgeInsets.symmetric(horizontal: 12.0),
//           child: Text(
//             "${selectedQuestions[index].question}",
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 21.0,
//             ),
//             textAlign: TextAlign.start,
//             softWrap: true,
//           ),
//         ),
//         const SizedBox(height: 12.0),
//         // Display options with radio buttons
//         for (int i = 0; i < selectedQuestions[index].answers.length; i++)
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Radio(
//                 fillColor: const MaterialStatePropertyAll<Color>(Colors.amber),
//                 value: selectedQuestions[index].answers.keys.toList()[i],
//                 groupValue: selectedAnswers[index],
//                 onChanged: (String? value) {
//                   setState(() {
//                     selectedAnswers[index] = value!;
//                     correctAnswers[index] =
//                     selectedQuestions[index].answers[value]!;
//                   });
//                 },
//               ),
//               Expanded(
//                 child: Text(
//                   selectedQuestions[index].answers.keys.toList()[i],
//                   style: const TextStyle(
//                       fontSize: 18,
//                       color: Colors.amber,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//         const Spacer(),
//         // Next Button
//
//         Align(
//           alignment: Alignment.bottomRight,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: ElevatedButton(
//               onPressed: goToNextQuestion,
//               child: const Text("Next"),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void goToNextQuestion() {
//     if (questionIndex + 1 < selectedQuestions.length) {
//       setState(() {
//         questionIndex++;
//         _controller.animateToPage(
//           questionIndex,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//         _timerController.restart(duration: questionDuration); // Reset timer
//       });
//     } else {
//       int timeTaken = getTime();
//       // Pass userEmail to ScoreScreen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ScoreScreen(correctAnswers, timeTaken, widget.userEmail),
//         ),
//       );
//     }
//   }
//
//   void startQuestionTimer() {
//     _timerController.start();
//   }
//
//   int getTime() {
//     return DateTime.now().difference(startTime!).inSeconds;
//   }
// }


import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:quizapp/model/quiz.dart';
import 'package:quizapp/view/result_page.dart';

class PlayQuiz extends StatefulWidget {
  final String userEmail; // Add userEmail as a required parameter

  const PlayQuiz({Key? key, required this.userEmail}) : super(key: key); // Initialize userEmail

  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  late PageController _controller;
  late List<String> selectedAnswers;
  List<Play> selectedQuestions = [];
  List<bool> correctAnswers = List.filled(10, false); // 10 questions
  int questionIndex = 0;
  final int questionDuration = 15; // 15 seconds for each question
  late CountDownController _timerController;

  DateTime? startTime;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _timerController = CountDownController();
    selectedAnswers = List.filled(10, '');

    // Randomly select 10 questions and shuffle them
    selectedQuestions = getRandomQuestions(10);
    correctAnswers = List.filled(selectedQuestions.length, false);

    startTime = DateTime.now();
    startQuestionTimer(); // Start the timer for the first question
  }

  // Randomly select `count` number of questions and shuffle them
  List<Play> getRandomQuestions(int count) {
    List<Play> shuffledQuestions = List.from(questions);
    shuffledQuestions.shuffle(Random());
    return shuffledQuestions.take(count).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2a4bce),
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(), // Disable swiping
              itemCount: selectedQuestions.length,
              itemBuilder: (context, index) {
                return buildQuestionContent(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuestionContent(int index) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Scrollable Question and Answers
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question Image
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                        offset: const Offset(5.0, 5.0),
                      ),
                    ],
                    border: Border.all(color: Colors.white, width: 1.5),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/studydesk.png'),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                ),
                // Question Text
                Text(
                  "Question ${index + 1}/${selectedQuestions.length}",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                const SizedBox(height: 20.0),
                // Question Body
                Text(
                  "${selectedQuestions[index].question}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21.0,
                  ),
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
                const SizedBox(height: 12.0),
                // Options with radio buttons
                for (int i = 0; i < selectedQuestions[index].answers.length; i++)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        fillColor: const MaterialStatePropertyAll<Color>(Colors.amber),
                        value: selectedQuestions[index].answers.keys.toList()[i],
                        groupValue: selectedAnswers[index],
                        onChanged: (String? value) {
                          setState(() {
                            selectedAnswers[index] = value!;
                            correctAnswers[index] =
                            selectedQuestions[index].answers[value]!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          selectedQuestions[index].answers.keys.toList()[i],
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        // Timer and Next Button Row
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Timer on the right side above the next button
              CircularCountDownTimer(
                duration: questionDuration,
                initialDuration: 0,
                controller: _timerController,
                width: 70,
                height: 70,
                ringColor: Colors.green[300]!,
                fillColor: Colors.red[400]!,
                strokeWidth: 8.0,
                strokeCap: StrokeCap.round,
                textStyle: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                isReverse: true,
                onComplete: () {
                  goToNextQuestion(); // Automatically go to the next question
                },
              ),
              // Next Button
              ElevatedButton(
                onPressed: goToNextQuestion,
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void goToNextQuestion() {
    if (questionIndex + 1 < selectedQuestions.length) {
      setState(() {
        questionIndex++;
        _controller.animateToPage(
          questionIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _timerController.restart(duration: questionDuration); // Reset timer
      });
    } else {
      int timeTaken = getTime();
      // Pass userEmail to ScoreScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreScreen(correctAnswers, timeTaken, widget.userEmail),
        ),
      );
    }
  }

  void startQuestionTimer() {
    _timerController.start();
  }

  int getTime() {
    return DateTime.now().difference(startTime!).inSeconds;
  }
}
