import 'package:flutter/material.dart';
import 'package:quize_app/features/quize/screens/question.dart';

class QuizeHome extends StatelessWidget {
  const QuizeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('welcome to the quize feature'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              height: 220,
              color: const Color.fromARGB(134, 255, 255, 255),
            ),
            const SizedBox(height: 70),
            const Text(
              "learn flutter the fun way",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              label: const Text("take quize"),
              icon: const Icon(Icons.arrow_forward),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QuizeQuestion()));
              },
            ),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
