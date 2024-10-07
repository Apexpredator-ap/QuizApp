import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../db/helper.dart'; // Replace with your database helper import
import '../view/login.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> users = [];
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    List<Map<String, dynamic>> dbUsers = await dbHelper.getAllUsers();

    // Initialize the users list with a password visibility flag
    users = dbUsers.map((user) {
      return {
        ...user,
        'passwordVisible': false, // Initially, password is hidden
      };
    }).toList();

    setState(() {});
  }

  void deleteUser(int id) async {
    await dbHelper.deleteUser(id);
    fetchUsers();
    Get.snackbar("Deleted", "User deleted successfully", snackPosition: SnackPosition.BOTTOM);
  }

  void editUser(Map<String, dynamic> user) {
    // Show a dialog to edit email and password
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final emailController = TextEditingController(text: user['email']);
        final passwordController = TextEditingController(text: user['password']);

        return AlertDialog(
          title: Text("Edit User"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Update user details in the database
                dbHelper.updateUser(
                  user['id'],
                  emailController.text,
                  passwordController.text,
                );

                // Update the user details in the UI
                setState(() {
                  user['email'] = emailController.text;
                  user['password'] = passwordController.text;
                });

                Navigator.of(context).pop();
                Get.snackbar(
                  "Updated",
                  "User details updated successfully",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> clearAllUsers() async {
    await dbHelper.clearAllUsers();
    fetchUsers();
    Get.snackbar("Success", "Successfully cleared all users", snackPosition: SnackPosition.BOTTOM);
  }

  void showClearConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Clear All Users"),
          content: Text("Are you sure you want to clear all users?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                clearAllUsers();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void togglePasswordVisibility(int index) {
    setState(() {
      users[index]['passwordVisible'] = !users[index]['passwordVisible'];
    });
  }

  void logout() {
    // Clear navigation stack and go to login page
    Get.offAll(() => LoginPage());

    // Show a GetX snackbar with a blue background
    Get.snackbar(
      "Logout",
      "Admin logout 😊",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.logout, color: Colors.white), // Logout icon on the left
          onPressed: logout, // Trigger the logout function
        ),
        title: Text(
          "Admin",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_sweep, color: Colors.red),
            onPressed: showClearConfirmationDialog, // Clear all users
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              "💀 Welcome Admin ☠️",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded; // Toggle the user list expansion
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                Text(
                  "Users (${users.length})",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          if (isExpanded) ...[
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  bool passwordVisible = user['passwordVisible'];
                  return ListTile(
                    title: Text(
                      user['name'], // Display user name
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user['email'], // Display user email
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              passwordVisible
                                  ? user['password'] // Show password if visible
                                  : '******', // Show hidden password
                              style: TextStyle(color: Colors.white),
                            ),
                            IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.lock_open // Show unlock icon if password is visible
                                    : Icons.lock, // Show lock icon if password is hidden
                                color: Colors.white,
                              ),
                              onPressed: () => togglePasswordVisibility(index), // Toggle password visibility
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.yellow),
                          onPressed: () => editUser(user), // Edit user
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteUser(user['id']), // Delete user
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
