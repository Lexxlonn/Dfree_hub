import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://nhyvswccailgpawzbelw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5oeXZzd2NjYWlsZ3Bhd3piZWx3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY5OTg5NDMsImV4cCI6MjA1MjU3NDk0M30.Vg7TWu-eB4LH1S9AOeSS4RITUvSLLVQUWKvqfyxkrPM',
  );
  runApp(const MainApp());
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
