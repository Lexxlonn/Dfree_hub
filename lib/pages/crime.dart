import 'package:flutter/material.dart';

class Crime extends StatelessWidget {
  const Crime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crime'),
      ),
      body: Center(
        child: Text('Crime Page'),
      ),
    );
  }
}
