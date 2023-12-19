import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:games_soccer_static/screens/auth/login.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const MaterialApp(
          title: 'My App',
          home: LoginScreen(),
        );
      },
    );
  }
}
