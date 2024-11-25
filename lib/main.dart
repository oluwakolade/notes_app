import 'package:flutter/material.dart';
import 'package:notely/provider/notes_provider.dart';
import 'package:notely/screens/get_started.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesProvider(),
        ),
        // ChangeNotifierProvider(create: (context) => CreateAccountController())
      ],
      child: const MaterialApp(
        title: 'Notely App',
        home: GetStarted(),
      ),
    );
  }
}
