// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quizapp/view/registration.dart';
// import '../admin/admin_page.dart';
// import '../db/helper.dart'; // Your SQLite helper class for database operations
// import '../widgets/button.dart';
// import '../widgets/text_field.dart';
// import 'home.dart'; // The homepage for non-admin users
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   bool _validateEmail(String email) {
//     String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
//     RegExp regex = RegExp(pattern);
//     return regex.hasMatch(email);
//   }
//
//   bool _validatePassword(String password) {
//     return password.length >= 6;
//   }
//
//   void login() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//
//     // Validate inputs
//     if (!_validateEmail(email)) {
//       Get.snackbar("Invalid Email", "Please enter a valid email address", snackPosition: SnackPosition.BOTTOM);
//       return;
//     }
//
//     if (!_validatePassword(password)) {
//       Get.snackbar("Invalid Password", "Password should be at least 6 characters long", snackPosition: SnackPosition.BOTTOM);
//       return;
//     }
//
//     // Admin login logic
//     if (email == "admin@gmail.com" && password == "admin@123") {
//       Get.offAll(() => AdminPage()); // Navigate to AdminPage if admin credentials are used
//     } else {
//       // Check regular user login in SQLite database
//       bool success = await DatabaseHelper().loginUser(email, password);
//       if (success) {
//         Get.offAll(() => HomePage()); // Navigate to HomePage for normal users
//       } else {
//         Get.snackbar("Login Failed", "Invalid email or password", snackPosition: SnackPosition.BOTTOM);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 height: height / 2.7,
//                 child: Image.asset("assets/images/login.jpg"),
//               ),
//               TextFieldInp(
//                 textEditingController: emailController,
//                 hintText: "Enter your email",
//                 icon: Icons.email,
//               ),
//               TextFieldInp(
//                 textEditingController: passwordController,
//                 hintText: "Enter your Password",
//                 icon: Icons.lock,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 35),
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     "Forgot password?",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
//                   ),
//                 ),
//               ),
//               SizedBox(height: height / 20),
//               MyButton(onTab: login, text: "Log In"),
//               SizedBox(height: height / 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have an account?", style: TextStyle(fontSize: 16)),
//                   GestureDetector(
//                     onTap: () {
//                       Get.to(() => RegisterPage()); // Navigate to RegistrationPage
//                     },
//                     child: const Text(" SignUp", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// view/login.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/view/pre_home.dart';
import 'package:quizapp/view/registration.dart';
import '../admin/admin_page.dart';
import '../db/helper.dart';
import '../widgets/button.dart';
import '../widgets/text_field.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    dbHelper.database; // Initialize the database
  }

  bool _validateEmail(String email) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (!_validateEmail(email)) {
      Get.snackbar("Invalid Email", "Please enter a valid email address", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (!_validatePassword(password)) {
      Get.snackbar("Invalid Password", "Password should be at least 6 characters long", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      if (dbHelper.isAdmin(email, password)) {
        Get.offAll(() => AdminPage());
      } else {
        bool success = await dbHelper.loginUser(email, password);
        if (success) {
          Get.offAll(() => PreHomePage(userEmail: email,));
        } else {
          Get.snackbar("Login Failed", "Invalid email or password", snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      print("Error during login: $e");
      Get.snackbar("Error", "An unexpected error occurred", snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: height / 2.7,
                child: Image.asset("assets/images/login.jpg"),
              ),
              TextFieldInp(
                textEditingController: emailController,
                hintText: "Enter your email",
                icon: Icons.email,
              ),
              TextFieldInp(
                textEditingController: passwordController,
                hintText: "Enter your Password",
                icon: Icons.lock,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: height / 20),
              MyButton(onTab: login, text: "Log In"),
              SizedBox(height: height / 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?", style: TextStyle(fontSize: 16)),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => RegisterPage());
                    },
                    child: const Text(" SignUp", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
