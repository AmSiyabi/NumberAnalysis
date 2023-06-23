import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // keep track of what the user is typing in the text field
  final _textController = TextEditingController();

  //store user text into a variable
  String userPost = '';
  bool displayAnalysis = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Number Analyzer'),
          backgroundColor: const Color.fromARGB(255, 68, 118, 44),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Content of the analysis
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      if (displayAnalysis && isNumeric(userPost))
                        Text(
                          'The number $userPost',
                          style: const TextStyle(
                            fontSize: 35,
                            fontFamily: 'AbrilFatface',
                          ),
                        ),
                      if (displayAnalysis && isNumeric(userPost))
                        Text(
                          isPrime(int.parse(userPost))
                              ? 'is Prime'
                              : 'is Not Prime',
                          style: const TextStyle(
                            fontSize: 35,
                            fontFamily: 'AbrilFatface',
                          ),
                        ),
                      if (displayAnalysis && isNumeric(userPost))
                        Text(
                          int.parse(userPost) < 0
                              ? 'is Negative'
                              : 'is Positive',
                          style: const TextStyle(
                            fontSize: 35,
                            fontFamily: 'AbrilFatface',
                          ),
                        ),
                      if (displayAnalysis && isNumeric(userPost))
                        Text(
                          int.parse(userPost) % 2 == 0 ? 'is Even' : 'is Odd',
                          style: const TextStyle(
                            fontSize: 35,
                            fontFamily: 'AbrilFatface',
                          ),
                        ),
                      if (displayAnalysis && !isNumeric(userPost))
                        const Text(
                          'Invalid input',
                          style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'AbrilFatface',
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // the user input
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Type a number',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      //clear the text
                      _textController.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userPost = _textController.text;
                    displayAnalysis = true;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 68, 118, 44)),
                ),
                child: const Text('Analyse!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }

  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}

int factorial(int number) {
  if (number < 0) {
    return -1;
  }

  int result = 1;
  for (int i = 2; i <= number; i++) {
    result *= i;
  }

  return result;
}

bool isNumeric(String str) {
  // ignore: unnecessary_null_comparison
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}
