// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../db/helper.dart';
// import '../widgets/button.dart';
// import '../widgets/text_field.dart';
// import 'login.dart';
//
// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);
//
//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   bool isLoading = false;
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
//   bool _validateName(String name) {
//     return name.isNotEmpty;
//   }
//
//   void signUpUser() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     String name = nameController.text.trim();
//
//     // Validate inputs
//     if (!_validateName(name)) {
//       Get.snackbar("Invalid Name", "Name cannot be empty",
//           snackPosition: SnackPosition.BOTTOM);
//       return;
//     }
//
//     if (!_validateEmail(email)) {
//       Get.snackbar("Invalid Email", "Please enter a valid email address",
//           snackPosition: SnackPosition.BOTTOM);
//       return;
//     }
//
//     if (!_validatePassword(password)) {
//       Get.snackbar(
//           "Invalid Password", "Password should be at least 6 characters long",
//           snackPosition: SnackPosition.BOTTOM);
//       return;
//     }
//
//     setState(() {
//       isLoading = true;
//     });
//
//     int res = await DatabaseHelper().registerUser(name, email, password);
//     if (res > 0) {
//       Get.snackbar("Account created successfully", " ");
//       Get.offAll(
//           () => LoginPage()); // Navigate back to LoginPage after registration
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//       Get.snackbar("Error", "Email already in use",
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Register')),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: double.infinity,
//                   height: height / 3,
//                   child: Image.asset("assets/images/signup.jpeg"),
//                 ),
//                 TextFieldInp(
//                   textEditingController: nameController,
//                   hintText: "Enter your name",
//                   icon: Icons.person,
//                 ),
//                 TextFieldInp(
//                   textEditingController: emailController,
//                   hintText: "Enter your email",
//                   icon: Icons.email,
//                 ),
//                 TextFieldInp(
//                   textEditingController: passwordController,
//                   hintText: "Enter your Password",
//                   icon: Icons.lock,
//                 ),
//                 MyButton(onTab: signUpUser, text: "Sign Up"),
//                 SizedBox(height: height / 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Already have an account?",
//                         style: TextStyle(fontSize: 16)),
//                     GestureDetector(
//                       onTap: () => Get.to(LoginPage()),
//                       child: Text(" Login",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 16)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// view/registration.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../db/helper.dart';
import '../widgets/button.dart';
import '../widgets/text_field.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();
  bool isLoading = false;

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

  bool _validateName(String name) {
    return name.isNotEmpty;
  }

  void signUpUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String name = nameController.text.trim();

    if (!_validateName(name)) {
      Get.snackbar("Invalid Name", "Name cannot be empty", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (!_validateEmail(email)) {
      Get.snackbar("Invalid Email", "Please enter a valid email address", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (!_validatePassword(password)) {
      Get.snackbar("Invalid Password", "Password should be at least 6 characters long", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      int res = await dbHelper.registerUser(name, email, password);
      if (res > 0) {
        Get.snackbar("Account created successfully", " ");
        Get.offAll(() => LoginPage());
      } else {
        Get.snackbar("Error", "Email already in use", snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Error during registration: $e");
      Get.snackbar("Error", "An unexpected error occurred", snackPosition: SnackPosition.BOTTOM);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: AppBar(title: Text('Register')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: height / 3,
                  child: Image.asset("assets/images/signup.jpeg"),
                ),
                TextFieldInp(
                  textEditingController: nameController,
                  hintText: "Enter your name",
                  icon: Icons.person,
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
                MyButton(onTab: signUpUser, text: "Sign Up"),
                SizedBox(height: height / 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: TextStyle(fontSize: 16)),
                    GestureDetector(
                      onTap: () => Get.to(LoginPage()),
                      child: Text(" Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
