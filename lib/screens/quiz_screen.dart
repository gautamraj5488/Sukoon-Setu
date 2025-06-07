import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sukoon_setu/models/user_info_model.dart';
import 'package:sukoon_setu/screens/home_screen.dart';

class Question {
  final String text;
  final List<String> options;
  Question({required this.text, required this.options});
}

class QuizScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  final UserInfo userInfo;

  const QuizScreen({super.key, required this.userInfo, required this.onLocaleChange});
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  late Timer _timer;
  int _timeLeft = 120; // 2 minutes in seconds

  final List<Question> questions = [
    Question(
        text: 'पिछले 2 हफ्तों में, आपने कितनी बार उदास या निराश महसूस किया है?',
        options: ['बिल्कुल नहीं', 'कुछ दिन', 'आधे से ज्यादा दिन', 'लगभग हर दिन']),
    Question(
        text: 'क्या आप रोज़ाना के काम में मज़ा या दिलचस्पी कम महसूस करते हैं?',
        options: ['बिल्कुल नहीं', 'कुछ दिन', 'आधे से ज्यादा दिन', 'लगभग हर दिन']),
    Question(
        text: 'क्या आपको सोने में परेशानी होती है या बहुत ज्यादा नींद आती है?',
        options: ['बिल्कुल नहीं', 'कुछ दिन', 'आधे से ज्यादा दिन', 'लगभग हर दिन']),
    Question(
        text: 'क्या आप थका हुआ या कम एनर्जी महसूस करते हैं?',
        options: ['बिल्कुल नहीं', 'कुछ दिन', 'आधे से ज्यादा दिन', 'लगभग हर दिन']),
    Question(
        text: 'क्या आपको ध्यान लगाने में परेशानी होती है?',
        options: ['बिल्कुल नहीं', 'कुछ दिन', 'आधे से ज्यादा दिन', 'लगभग हर दिन']),
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft == 0) {
        _timer.cancel();
        _navigateToHome();
      } else {
        setState(() => _timeLeft--);
      }
    });
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeScreen(onLocaleChange: widget.onLocaleChange,)),
    );
  }

  void _onOptionSelected() {
    if (_currentIndex < questions.length - 1) {
      setState(() => _currentIndex++);
      _controller.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _timer.cancel();
      _navigateToHome();
    }
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text("मानसिक स्वास्थ्य मूल्यांकन",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[800])),
                  ),
                  SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: (index + 1) / questions.length,
                    backgroundColor: Colors.teal[100],
                    valueColor: AlwaysStoppedAnimation(Colors.teal),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "समय बचा है: ${_formatTime(_timeLeft)}",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text("प्रश्न ${index + 1} / ${questions.length}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
                      ],
                    ),
                    child: Text(
                      question.text,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 30),
                  ...question.options.map((option) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: ElevatedButton(
                          onPressed: _onOptionSelected,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            side: BorderSide(color: Colors.teal),
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.circle_outlined, size: 18),
                              SizedBox(width: 10),
                              Expanded(child: Text(option)),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}