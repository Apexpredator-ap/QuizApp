class Play {
  String? question;
  Map<String, bool> answers;

  Play(
      this.question,
      this.answers,
      );
}

List<Play> questions = [
  Play(
      'Who created the Python programming language?',
      {
        'Guido van Rossum': true,
        'James Gosling': false,
        'Bjarne Stroustrup': false,
        'Dennis Ritchie': false,
      }
  ),

  Play(
      'In which year was the C programming language developed?',
      {
        '1969': false,
        '1972': true,
        '1980': false,
        '1995': false,
      }
  ),

  Play(
      'Who is known as the father of Java programming language?',
      {
        'Bill Joy': false,
        'James Gosling': true,
        'Bjarne Stroustrup': false,
        'Tim Berners-Lee': false,
      }
  ),

  Play(
      'What does IDE stand for in programming?',
      {
        'Integrated Development Environment': true,
        'Interactive Design Environment': false,
        'Internal Development Engine': false,
        'Intelligent Design Editor': false,
      }
  ),

  Play(
      'Which of these is not a valid Python data type?',
      {
        'int': false,
        'float': false,
        'char': true,
        'bool': false,
      }
  ),

  Play(
      'In C programming, what is the purpose of the \'scanf\' function?',
      {
        'To print output to the console': false,
        'To read input from the user': true,
        'To define a new function': false,
        'To include a header file': false,
      }
  ),

  Play(
      'What is the Java mascot?',
      {
        'Snake': false,
        'Dolphin': false,
        'Duke': true,
        'Gecko': false,
      }
  ),

  Play(
      'Which symbol is used for single-line comments in Python?',
      {
        '//': false,
        '#': true,
        '/* */': false,
        '--': false,
      }
  ),

  Play(
      'In C, what is the size of an int data type on most 32-bit systems?',
      {
        '1 byte': false,
        '2 bytes': false,
        '4 bytes': true,
        '8 bytes': false,
      }
  ),

  Play(
      'Which keyword is used to define a class in Java?',
      {
        'struct': false,
        'class': true,
        'def': false,
        'interface': false,
      }
  ),

  Play(
      'What does PEP 8 refer to in Python?',
      {
        'A popular Python framework': false,
        'A style guide for Python code': true,
        'A Python enhancement proposal system': false,
        'A Python error handling mechanism': false,
      }
  ),

  Play(
      'In C programming, which operator is used for pointer declaration?',
      {
        '&': false,
        '*': true,
        '->': false,
        '.': false,
      }
  ),

  Play(
      'What is the Java Runtime Environment (JRE)?',
      {
        'A compiler for Java code': false,
        'An IDE for Java development': false,
        'The environment needed to run Java programs': true,
        'A Java testing framework': false,
      }
  ),

  Play(
      'Which of these is not a valid loop in Python?',
      {
        'for loop': false,
        'while loop': false,
        'do-while loop': true,
        'nested loop': false,
      }
  ),

  Play(
      'What does \'printf\' stand for in C?',
      {
        'Print format': true,
        'Print file': false,
        'Print function': false,
        'Print formatted': false,
      }
  ),

  Play(
      'In Java, which keyword is used to implement multiple inheritance?',
      {
        'extends': false,
        'implements': true,
        'inherits': false,
        'interface': false,
      }
  ),

  Play(
      'What is the output of print(type(1)) in Python?',
      {
        '<class \'int\'>': true,
        '<class \'float\'>': false,
        '<class \'str\'>': false,
        '<class \'number\'>': false,
      }
  ),

  Play(
      'Which header file is necessary for using printf() function in C?',
      {
        'math.h': false,
        'string.h': false,
        'stdio.h': true,
        'stdlib.h': false,
      }
  ),

  Play(
      'What is the default value of a boolean variable in Java?',
      {
        'true': false,
        'false': true,
        'null': false,
        '0': false,
      }
  ),

  Play(
      'In Python, what does the \'self\' keyword represent in a class method?',
      {
        'The class itself': false,
        'The instance of the class': true,
        'The parent class': false,
        'The main function': false,
      }
  ),

  Play(
      'What is the purpose of \'void\' keyword in C?',
      {
        'To declare a variable': false,
        'To indicate that a function returns nothing': true,
        'To create an infinite loop': false,
        'To include a header file': false,
      }
  ),

  Play(
      'Which of these is not a valid access modifier in Java?',
      {
        'public': false,
        'private': false,
        'protected': false,
        'friend': true,
      }
  ),

  Play(
      'What does the \'len()\' function do in Python?',
      {
        'Returns the length of a string or list': true,
        'Defines the length of a variable': false,
        'Creates a new list': false,
        'Converts a string to lowercase': false,
      }
  ),

  Play(
      'In C, what does the \'sizeof\' operator return?',
      {
        'The memory address of a variable': false,
        'The size of a variable in bytes': true,
        'The value of a variable': false,
        'The type of a variable': false,
      }
  ),

  Play(
      'What is the purpose of the \'final\' keyword in Java?',
      {
        'To declare a constant variable': true,
        'To end a program': false,
        'To define the main method': false,
        'To import a package': false,
      }
  ),

  Play(
      'Which of these is used to handle exceptions in Python?',
      {
        'if-else': false,
        'for-in': false,
        'try-except': true,
        'switch-case': false,
      }
  ),

  Play(
      'What is the correct way to declare a pointer to an integer in C?',
      {
        'int ptr;': false,
        'int *ptr;': true,
        'int &ptr;': false,
        'pointer int ptr;': false,
      }
  ),

  Play(
      'In Java, which class is the superclass of all classes?',
      {
        'Main': false,
        'Object': true,
        'Super': false,
        'Abstract': false,
      }
  ),

  Play(
      'What does the \'**\' operator do in Python?',
      {
        'Multiplication': false,
        'Exponentiation': true,
        'Bitwise XOR': false,
        'Logical AND': false,
      }
  ),

  Play(
      'In C programming, what does the \'static\' keyword do when used inside a function?',
      {
        'Makes the function globally accessible': false,
        'Prevents the function from being called': false,
        'Preserves the variable\'s value between function calls': true,
        'Allocates memory dynamically': false,
      }
  ),
];