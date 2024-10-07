// import 'package:flutter/material.dart';
// import 'package:quizapp/view/playquiz.dart';
// import 'home.dart';
//
//
// class PreHomePage extends StatelessWidget {
//   final String userEmail; // Declare userEmail
//   PreHomePage({Key? key, required this.userEmail}) : super(key: key); // Initialize userEmail
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.blue[300]!, Colors.blue[700]!],
//           ),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/images/quiz.jpg',
//                   width: 200,
//                   height: 200,
//                 ),
//                 SizedBox(height: 50),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => PlayQuiz(userEmail: userEmail,)),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.blue[700], backgroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: Text(
//                     "Let's Start",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/view/playquiz.dart';
import '../db/helper.dart';

class PreHomePage extends StatefulWidget {
  final String userEmail;

  PreHomePage({Key? key, required this.userEmail}) : super(key: key);

  @override
  _PreHomePageState createState() => _PreHomePageState();
}

class _PreHomePageState extends State<PreHomePage> {
  String userName = ''; // Store the user's name
  final DatabaseHelper dbHelper = DatabaseHelper(); // Initialize the database helper

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    final db = await dbHelper.database;
    var result = await db.query(
      'users',
      columns: ['name'],
      where: 'email = ?',
      whereArgs: [widget.userEmail],
    );

    if (result.isNotEmpty) {
      setState(() {
        userName = result.first['name'] as String; // Fetch the username
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue[300]!, Colors.blue[700]!],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display the username above the image
                Text(
                  'Welcome $userName',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/quiz.jpg',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PlayQuiz(userEmail: widget.userEmail)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue[700], backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    "Let's Start",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
