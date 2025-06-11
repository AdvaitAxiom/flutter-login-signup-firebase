import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_firebase_demo/firebase_options.dart';
import 'screens/wrapper.dart';

// At the top of your main.dart file, add:
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

// Then in your main function, before Firebase.initializeApp():
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.dotenv.load(fileName: ".env"); // Load environment variables
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Wrapper(),
    );
  }
}
