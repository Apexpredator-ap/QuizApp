// // import 'package:flutter/material.dart';
// // import 'package:confetti/confetti.dart';
// // import 'package:flutter/services.dart';
// // import 'package:quizapp/view/login.dart'; // Import your LoginPage
// // import 'package:quizapp/view/pre_home.dart';
// //
// // class ScoreScreen extends StatefulWidget {
// //   const ScoreScreen(this.ans, this.timeTaken, {super.key});
// //
// //   final List<dynamic> ans;
// //   final int timeTaken;
// //
// //   @override
// //   State<ScoreScreen> createState() => _ScoreScreenState();
// // }
// //
// // class _ScoreScreenState extends State<ScoreScreen> {
// //   late ConfettiController _controller;
// //   int totalScore = 0;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     calculateScore(widget.ans);
// //     _controller = ConfettiController(duration: const Duration(seconds: 10));
// //     _controller.play();
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return WillPopScope(
// //       onWillPop: () => _pop(),
// //       child: Stack(alignment: Alignment.topCenter, children: [
// //         Container(
// //           padding: const EdgeInsets.symmetric(horizontal: 10),
// //           decoration: const BoxDecoration(
// //               gradient: LinearGradient(
// //                 colors: [
// //                   Color(0xffe7bf74),
// //                   Color(0xfffcb69f),
// //                 ],
// //                 begin: FractionalOffset(1.0, 0.0),
// //                 end: FractionalOffset(0.0, 1.0),
// //               )),
// //         ),
// //         const SizedBox(
// //           height: 60,
// //         ),
// //         ConfettiWidget(
// //             confettiController: _controller,
// //             shouldLoop: true,
// //             emissionFrequency: 0.05,
// //             blastDirectionality: BlastDirectionality.explosive,
// //             gravity: 0.1),
// //         Align(
// //           alignment: Alignment.center,
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Text(
// //                 "Total Score: $totalScore",
// //                 softWrap: true,
// //                 textAlign: TextAlign.center,
// //                 style: const TextStyle(
// //                   fontSize: 21,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.deepOrangeAccent,
// //                   decoration: TextDecoration.none,
// //                 ),
// //               ),
// //               const SizedBox(height: 6.0),
// //               Text(
// //                 "Total Time: ${widget.timeTaken}sec",
// //                 softWrap: true,
// //                 textAlign: TextAlign.center,
// //                 style: const TextStyle(
// //                   fontSize: 21,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.deepOrangeAccent,
// //                   decoration: TextDecoration.none,
// //                 ),
// //               ),
// //               const SizedBox(height: 12.0),
// //               Text(
// //                   totalScore >= 9
// //                       ? '😇'
// //                       : totalScore >= 7
// //                       ? '😀'
// //                       : totalScore >= 4
// //                       ? '😔'
// //                       : '😭',
// //                   style: const TextStyle(
// //                       fontSize: 40, decoration: TextDecoration.none)),
// //
// //               // Adding buttons in a row
// //               const SizedBox(height: 24.0),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: [
// //                   // Restart Button
// //                   _buildButton('Restart', () {
// //                     _controller.stop();
// //                     Navigator.pushReplacement(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => PreHomePage()),
// //                     );
// //                   }),
// //
// //                   // Logout Button in the middle
// //                   _buildButton('Logout', () {
// //                     // Clear all routes and navigate to login
// //                     Navigator.pushAndRemoveUntil(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => const LoginPage()),
// //                           (route) => false,
// //                     );
// //                   }),
// //
// //                   // Exit Button
// //                   _buildButton('Exit', () {
// //                     _controller.stop();
// //                     _pop();
// //                   }),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ]),
// //     );
// //   }
// //
// //   // Method to build buttons with the same styling
// //   Widget _buildButton(String label, VoidCallback onPressed) {
// //     return TextButton(
// //       onPressed: onPressed,
// //       style: ButtonStyle(
// //         textStyle: MaterialStateProperty.all(
// //             const TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
// //         backgroundColor: MaterialStateProperty.all(Colors.white),
// //         foregroundColor: MaterialStateProperty.all(Colors.red.shade600),
// //         shadowColor: MaterialStateProperty.all(Colors.redAccent),
// //         minimumSize: MaterialStateProperty.all(const Size(120, 30)),
// //         elevation: MaterialStateProperty.all(10),
// //         side: MaterialStateProperty.all(
// //           const BorderSide(width: 2, color: Colors.deepOrangeAccent),
// //         ),
// //         shape: MaterialStateProperty.all(
// //           RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(24),
// //           ),
// //         ),
// //       ),
// //       child: Text(label),
// //     );
// //   }
// //
// //   Future<bool> _pop() async {
// //     SystemNavigator.pop();
// //     return true;
// //   }
// //
// //   void calculateScore(List<dynamic> ans) {
// //     for (int i = 0; i < ans.length; i++) {
// //       if (ans[i] == true) {
// //         totalScore++;
// //       }
// //     }
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:confetti/confetti.dart';
// import 'package:flutter/services.dart';
// import 'package:quizapp/view/login.dart'; // Import your LoginPage
// import 'package:quizapp/view/pre_home.dart';
//
// class ScoreScreen extends StatefulWidget {
//   const ScoreScreen(this.ans, this.timeTaken, {super.key});
//
//   final List<dynamic> ans;
//   final int timeTaken;
//
//   @override
//   State<ScoreScreen> createState() => _ScoreScreenState();
// }
//
// class _ScoreScreenState extends State<ScoreScreen> {
//   late ConfettiController _controller;
//   int totalScore = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     calculateScore(widget.ans);
//     _controller = ConfettiController(duration: const Duration(seconds: 10));
//     _controller.play();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => _pop(),
//       child: Stack(alignment: Alignment.topCenter, children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xffe7bf74),
//                 Color(0xfffcb69f),
//               ],
//               begin: FractionalOffset(1.0, 0.0),
//               end: FractionalOffset(0.0, 1.0),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 60,
//         ),
//         ConfettiWidget(
//           confettiController: _controller,
//           shouldLoop: true,
//           emissionFrequency: 0.05,
//           blastDirectionality: BlastDirectionality.explosive,
//           gravity: 0.1,
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Total Score: $totalScore",
//                 softWrap: true,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 21,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepOrangeAccent,
//                   decoration: TextDecoration.none,
//                 ),
//               ),
//               const SizedBox(height: 6.0),
//               Text(
//                 "Total Time: ${widget.timeTaken} sec",
//                 softWrap: true,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 21,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepOrangeAccent,
//                   decoration: TextDecoration.none,
//                 ),
//               ),
//               const SizedBox(height: 12.0),
//               Text(
//                 totalScore >= 9
//                     ? '😇'
//                     : totalScore >= 7
//                     ? '😀'
//                     : totalScore >= 4
//                     ? '😔'
//                     : '😭',
//                 style: const TextStyle(fontSize: 40, decoration: TextDecoration.none),
//               ),
//
//               // Adding buttons in a row
//               const SizedBox(height: 24.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Restart Button
//                   _buildButton('Restart', () {
//                     _controller.stop();
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) =>  PreHomePage()),
//                     );
//                   }),
//
//                   // Logout Button in the middle
//                   _buildButton('Logout', () {
//                     // Clear all routes and navigate to login
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(builder: (context) => const LoginPage()),
//                           (route) => false,
//                     );
//                   }),
//
//                   // Exit Button
//                   _buildButton('Exit', () {
//                     _controller.stop();
//                     _pop();
//                   }),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
//
//   // Method to build buttons with the same styling
//   Widget _buildButton(String label, VoidCallback onPressed) {
//     return TextButton(
//       onPressed: onPressed,
//       style: ButtonStyle(
//         textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
//         backgroundColor: MaterialStateProperty.all(Colors.white),
//         foregroundColor: MaterialStateProperty.all(Colors.red.shade600),
//         shadowColor: MaterialStateProperty.all(Colors.redAccent),
//         minimumSize: MaterialStateProperty.all(const Size(120, 30)),
//         elevation: MaterialStateProperty.all(10),
//         side: MaterialStateProperty.all(const BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//         shape: MaterialStateProperty.all(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24),
//           ),
//         ),
//       ),
//       child: Text(label),
//     );
//   }
//
//   Future<bool> _pop() async {
//     SystemNavigator.pop();
//     return true;
//   }
//
//   void calculateScore(List<dynamic> ans) {
//     for (int i = 0; i < ans.length; i++) {
//       if (ans[i] == true) {
//         totalScore++;
//       }
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:confetti/confetti.dart';
// import 'package:flutter/services.dart';
// import 'package:quizapp/view/login.dart'; // Import your LoginPage
// import 'package:quizapp/view/pre_home.dart';
//
// import '../db/helper.dart'; // Import your DatabaseHelper
//
// class ScoreScreen extends StatefulWidget {
//   const ScoreScreen(this.ans, this.timeTaken, this.userEmail, {super.key});
//
//   final List<dynamic> ans;
//   final int timeTaken;
//   final String userEmail; // Add userEmail to fetch and save scores
//
//   @override
//   State<ScoreScreen> createState() => _ScoreScreenState();
// }
//
// class _ScoreScreenState extends State<ScoreScreen> {
//   late ConfettiController _controller;
//   int totalScore = 0;
//   int highestScore = 0; // Variable to hold the highest score
//   final DatabaseHelper _databaseHelper = DatabaseHelper();
//
//   @override
//   void initState() {
//     super.initState();
//     calculateScore(widget.ans);
//     _controller = ConfettiController(duration: const Duration(seconds: 10));
//     _controller.play();
//     _fetchHighestScore();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Future<void> _fetchHighestScore() async {
//     highestScore = await _databaseHelper.getHighestScore(widget.userEmail);
//     setState(() {}); // Update the UI after fetching the highest score
//     _updateHighestScore(); // Check and update the highest score
//   }
//
//   Future<void> _updateHighestScore() async {
//     if (highestScore < totalScore) {
//       await _databaseHelper.saveHighestScore(widget.userEmail, totalScore);
//       highestScore = totalScore; // Update highest score in the state
//       setState(() {}); // Update UI to reflect the new highest score
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => _pop(),
//       child: Stack(alignment: Alignment.topCenter, children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xffe7bf74),
//                 Color(0xfffcb69f),
//               ],
//               begin: FractionalOffset(1.0, 0.0),
//               end: FractionalOffset(0.0, 1.0),
//             ),
//           ),
//         ),
//         const SizedBox(height: 60),
//         ConfettiWidget(
//           confettiController: _controller,
//           shouldLoop: true,
//           emissionFrequency: 0.05,
//           blastDirectionality: BlastDirectionality.explosive,
//           gravity: 0.1,
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Total Score: $totalScore",
//                 softWrap: true,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 21,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepOrangeAccent,
//                   decoration: TextDecoration.none,
//                 ),
//               ),
//               const SizedBox(height: 6.0),
//               Text(
//                 "Total Time: ${widget.timeTaken} sec",
//                 softWrap: true,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 21,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepOrangeAccent,
//                   decoration: TextDecoration.none,
//                 ),
//               ),
//               const SizedBox(height: 12.0),
//               Text(
//                 "Highest Score: $highestScore",
//                 softWrap: true,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 21,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepOrangeAccent,
//                   decoration: TextDecoration.none,
//                 ),
//               ),
//               const SizedBox(height: 12.0),
//               Text(
//                 totalScore >= 9
//                     ? '😇'
//                     : totalScore >= 7
//                     ? '😀'
//                     : totalScore >= 4
//                     ? '😔'
//                     : '😭',
//                 style: const TextStyle(fontSize: 40, decoration: TextDecoration.none),
//               ),
//
//               // Adding buttons in a row
//               const SizedBox(height: 24.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Restart Button
//                   _buildButton('Restart', () {
//                     _controller.stop();
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => PreHomePage(userEmail:  widget.userEmail,)),
//                     );
//                   }),
//
//                   // Logout Button in the middle
//                   _buildButton('Logout', () {
//                     // Clear all routes and navigate to login
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(builder: (context) => const LoginPage()),
//                           (route) => false,
//                     );
//                   }),
//
//                   // Exit Button
//                   _buildButton('Exit', () {
//                     _controller.stop();
//                     _pop();
//                   }),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
//
//   // Method to build buttons with the same styling
//   Widget _buildButton(String label, VoidCallback onPressed) {
//     return TextButton(
//       onPressed: onPressed,
//       style: ButtonStyle(
//         textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
//         backgroundColor: MaterialStateProperty.all(Colors.white),
//         foregroundColor: MaterialStateProperty.all(Colors.red.shade600),
//         shadowColor: MaterialStateProperty.all(Colors.redAccent),
//         minimumSize: MaterialStateProperty.all(const Size(120, 30)),
//         elevation: MaterialStateProperty.all(10),
//         side: MaterialStateProperty.all(const BorderSide(width: 2, color: Colors.deepOrangeAccent)),
//         shape: MaterialStateProperty.all(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24),
//           ),
//         ),
//       ),
//       child: Text(label),
//     );
//   }
//
//   Future<bool> _pop() async {
//     SystemNavigator.pop();
//     return true;
//   }
//
//   void calculateScore(List<dynamic> ans) {
//     for (int i = 0; i < ans.length; i++) {
//       if (ans[i] == true) {
//         totalScore++;
//       }
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/view/login.dart'; // Import your LoginPage
import 'package:quizapp/view/pre_home.dart';
import '../db/helper.dart'; // Import your DatabaseHelper

class ScoreScreen extends StatefulWidget {
  const ScoreScreen(this.ans, this.timeTaken, this.userEmail, {super.key});

  final List<dynamic> ans;
  final int timeTaken;
  final String userEmail; // Add userEmail to fetch and save scores

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  late ConfettiController _controller;
  int totalScore = 0;
  int highestScore = 0; // Variable to hold the highest score
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    calculateScore(widget.ans);
    _controller = ConfettiController(duration: const Duration(seconds: 10));
    _controller.play();
    _fetchHighestScore();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Fetch the highest score for the logged-in user
  Future<void> _fetchHighestScore() async {
    highestScore = await _databaseHelper.getHighestScore(widget.userEmail);
    setState(() {}); // Update the UI after fetching the highest score
    _updateHighestScore(); // Check and update the highest score if necessary
  }

  // Update the highest score if the current score is greater
  Future<void> _updateHighestScore() async {
    if (highestScore < totalScore) {
      await _databaseHelper.saveHighestScore(widget.userEmail, totalScore);
      highestScore = totalScore; // Update the highest score in the state
      setState(() {}); // Refresh UI with the new highest score
    }
  }

  // Calculate total score based on the answers
  void calculateScore(List<dynamic> ans) {
    for (int i = 0; i < ans.length; i++) {
      if (ans[i] == true) {
        totalScore++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _pop(),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background gradient
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffe7bf74),
                  Color(0xfffcb69f),
                ],
                begin: FractionalOffset(1.0, 0.0),
                end: FractionalOffset(0.0, 1.0),
              ),
            ),
          ),
          const SizedBox(height: 60),
          ConfettiWidget(
            confettiController: _controller,
            shouldLoop: true,
            emissionFrequency: 0.05,
            blastDirectionality: BlastDirectionality.explosive,
            gravity: 0.1,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display Total Score
                Text(
                  "Total Score: $totalScore",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 6.0),
                // Display Total Time Taken
                Text(
                  "Total Time: ${widget.timeTaken} sec",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 12.0),
                // Display current score emotion
                Text(
                  totalScore >= 9
                      ? '😇'
                      : totalScore >= 7
                      ? '😀'
                      : totalScore >= 4
                      ? '😔'
                      : '😭',
                  style: const TextStyle(
                    fontSize: 40,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 12.0),
                // Display Highest Score
                Text(
                  "Highest Score: $highestScore",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 24.0),
                // Buttons: Restart, Logout, Exit
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('Restart', () {
                      _controller.stop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PreHomePage(userEmail: widget.userEmail,)),
                      );
                    }),
                    _buildButton('Logout', () {
                      // Clear all routes and navigate to login
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                            (route) => false,
                      );
                    }),
                    _buildButton('Exit', () {
                      _controller.stop();
                      _pop();
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build buttons with the same styling
  Widget _buildButton(String label, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.red.shade600),
        shadowColor: MaterialStateProperty.all(Colors.redAccent),
        minimumSize: MaterialStateProperty.all(const Size(120, 30)),
        elevation: MaterialStateProperty.all(10),
        side: MaterialStateProperty.all(
          const BorderSide(width: 2, color: Colors.deepOrangeAccent),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      child: Text(label),
    );
  }

  // Method to exit the app
  Future<bool> _pop() async {
    SystemNavigator.pop();
    return true;
  }
}
