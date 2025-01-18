import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class LoginPage extends StatelessWidget {
   LoginPage({super.key});

final supabase = Supabase.instance.client;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the home page
            Navigator.pushNamed(context, '/home');
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}