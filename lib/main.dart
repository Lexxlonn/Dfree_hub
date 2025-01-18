import 'package:dfree_hub/pages/login.dart';
import 'package:dfree_hub/pages/education.dart';
import 'package:dfree_hub/pages/rehab.dart';
import 'package:dfree_hub/pages/crime.dart';
import 'package:dfree_hub/pages/setting.dart';
import 'package:dfree_hub/pages/expert.dart';
import 'package:dfree_hub/pages/profile.dart';
import 'package:dfree_hub/pages/event.dart';
import 'package:dfree_hub/pages/register.dart';
import 'package:dfree_hub/pages/otp.dart';
import 'package:dfree_hub/widgets/bottomnav.dart';
import 'package:dfree_hub/pages/profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://nhyvswccailgpawzbelw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5oeXZzd2NjYWlsZ3Bhd3piZWx3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY5OTg5NDMsImV4cCI6MjA1MjU3NDk0M30.Vg7TWu-eB4LH1S9AOeSS4RITUvSLLVQUWKvqfyxkrPM',
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/login': (context) => LoginPage(),
        '/profile': (context) => ProfileEdit(),
        '/settings': (context) => Setting(),
        '/education': (context) => Education(),
        '/rehab': (context) => Rehab(),
        '/events': (context) => Event(),
        '/crime': (context) => Crime(),
        '/experts': (context) => Expert(),
        '/profile_edit': (context) => ProfileEdit(),
        '/otp': (context) => OTPpage(),
        '/bottomnav': (context) => BottomNav(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
