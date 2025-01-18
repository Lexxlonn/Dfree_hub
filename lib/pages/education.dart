import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          const Text(
            'Informative and Evocative',
            textAlign: TextAlign.center, // Center the text horizontally
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20), // Optional margin
            height: 220, // Set a height for the container
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                  255, 216, 222, 232), // Background color of the container
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
          ),
          // Add other content or widgets here as needed
        ],
      ),
    );
  }
}
