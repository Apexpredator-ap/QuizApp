// // import 'package:sqflite/sqflite.dart';
// // import 'package:path/path.dart';
// //
// // class DatabaseHelper {
// //   static final DatabaseHelper _instance = DatabaseHelper._internal();
// //   static Database? _database;
// //
// //   factory DatabaseHelper() {
// //     return _instance;
// //   }
// //
// //   DatabaseHelper._internal();
// //
// //   Future<Database> get database async {
// //     if (_database != null) return _database!;
// //     _database = await _initDatabase();
// //     return _database!;
// //   }
// //
// //   Future<Database> _initDatabase() async {
// //     String path = join(await getDatabasesPath(), 'user_database.db');
// //     return await openDatabase(
// //       path,
// //       version: 1,
// //       onCreate: _onCreate,
// //     );
// //   }
// //
// //   // Create the users table
// //   Future _onCreate(Database db, int version) async {
// //     await db.execute('''
// //       CREATE TABLE users(
// //         id INTEGER PRIMARY KEY AUTOINCREMENT,
// //         name TEXT,
// //         email TEXT UNIQUE,
// //         password TEXT
// //       )
// //     ''');
// //   }
// //
// //   // Insert a new user
// //   Future<int> registerUser(String name, String email, String password) async {
// //     final db = await database;
// //     try {
// //       return await db.insert('users', {
// //         'name': name,
// //         'email': email,
// //         'password': password,
// //       });
// //     } catch (e) {
// //       return -1; // Error: email already in use
// //     }
// //   }
// //
// //   // Login user
// //   Future<bool> loginUser(String email, String password) async {
// //     final db = await database;
// //     List<Map<String, dynamic>> result = await db.query(
// //       'users',
// //       where: 'email = ? AND password = ?',
// //       whereArgs: [email, password],
// //     );
// //     return result.isNotEmpty;
// //   }
// //
// //   // Check if the user is an admin
// //   bool isAdmin(String email, String password) {
// //     return email == 'admin@gmail.com' && password == 'admin@123';
// //   }
// //
// //   // Get all users (for Admin Page)
// //   Future<List<Map<String, dynamic>>> getAllUsers() async {
// //     final db = await database;
// //     return await db.query('users');
// //   }
// //
// //   // Delete a user
// //   Future<int> deleteUser(int id) async {
// //     final db = await database;
// //     return await db.delete('users', where: 'id = ?', whereArgs: [id]);
// //   }
// //
// //   // Clear all users except admin
// //   Future<int> clearAllUsers() async {
// //     final db = await database;
// //     return await db.delete('users', where: 'email != ?', whereArgs: ['admin@gmail.com']);
// //   }
// // }
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   static Database? _database;
//
//   factory DatabaseHelper() {
//     return _instance;
//   }
//
//   DatabaseHelper._internal();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'user_database.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }
//
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users(
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT,
//         email TEXT UNIQUE,
//         password TEXT
//       )
//     ''');
//   }
//
//   Future<int> registerUser(String name, String email, String password) async {
//     final db = await database;
//     try {
//       print("Attempting to register user: $email");
//       int result = await db.insert('users', {
//         'name': name,
//         'email': email,
//         'password': password,
//       });
//       print("User registered successfully with id: $result");
//       return result;
//     } catch (e) {
//       print("Error registering user: $e");
//       return -1; // Error: email already in use
//     }
//   }
//
//   Future<bool> loginUser(String email, String password) async {
//     final db = await database;
//     try {
//       print("Attempting to login user: $email");
//       List<Map<String, dynamic>> result = await db.query(
//         'users',
//         where: 'email = ? AND password = ?',
//         whereArgs: [email, password],
//       );
//       print("Login result: ${result.isNotEmpty}");
//       return result.isNotEmpty;
//     } catch (e) {
//       print("Error logging in user: $e");
//       return false;
//     }
//   }
//
//   bool isAdmin(String email, String password) {
//     return email == 'admin@gmail.com' && password == 'admin@123';
//   }
//
//   Future<List<Map<String, dynamic>>> getAllUsers() async {
//     final db = await database;
//     return await db.query('users');
//   }
//
//   Future<int> deleteUser(int id) async {
//     final db = await database;
//     return await db.delete('users', where: 'id = ?', whereArgs: [id]);
//   }
//
//   Future<int> clearAllUsers() async {
//     final db = await database;
//     return await db.delete('users', where: 'email != ?', whereArgs: ['admin@gmail.com']);
//   }
//
//   Future<void> updateUser(int id, String email, String password) async {
//     final db = await database;
//     await db.update(
//       'users',
//       {
//         'email': email,
//         'password': password,
//       },
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }


import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT UNIQUE,
        password TEXT
      )
    ''');
  }

  Future<int> registerUser(String name, String email, String password) async {
    final db = await database;
    try {
      print("Attempting to register user: $email");
      int result = await db.insert('users', {
        'name': name,
        'email': email,
        'password': password,
      });
      print("User registered successfully with id: $result");
      return result;
    } catch (e) {
      print("Error registering user: $e");
      return -1; // Error: email already in use
    }
  }

  Future<bool> loginUser(String email, String password) async {
    final db = await database;
    try {
      print("Attempting to login user: $email");
      List<Map<String, dynamic>> result = await db.query(
        'users',
        where: 'email = ? AND password = ?',
        whereArgs: [email, password],
      );
      print("Login result: ${result.isNotEmpty}");
      return result.isNotEmpty;
    } catch (e) {
      print("Error logging in user: $e");
      return false;
    }
  }

  bool isAdmin(String email, String password) {
    return email == 'admin@gmail.com' && password == 'admin@123';
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await database;
    return await db.query('users');
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> clearAllUsers() async {
    final db = await database;
    return await db.delete('users', where: 'email != ?', whereArgs: ['admin@gmail.com']);
  }

  Future<void> updateUser(int id, String email, String password) async {
    final db = await database;
    await db.update(
      'users',
      {
        'email': email,
        'password': password,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Fetch the highest score for the given user
  Future<int> getHighestScore(String userEmail) async {
    final db = await database;
    var result = await db.query(
      'users',
      columns: ['highest_score'],
      where: 'email = ?',
      whereArgs: [userEmail],
    );

    if (result.isNotEmpty) {
      return result.first['highest_score'] as int;
    }
    return 0; // Return 0 if no score exists
  }

  // Save or update the highest score for the user
  Future<void> saveHighestScore(String userEmail, int score) async {
    final db = await database;

    // Check if the user already exists
    var result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [userEmail],
    );

    if (result.isNotEmpty) {
      // Update the existing user's highest score
      await db.update(
        'users',
        {'highest_score': score},
        where: 'email = ?',
        whereArgs: [userEmail],
      );
    } else {
      // Insert a new user with the highest score
      await db.insert(
        'users',
        {
          'email': userEmail,
          'highest_score': score,
        },
      );
    }
  }





}
