import 'package:flutter/material.dart';
import 'package:notely/provider/notes_provider.dart';
import 'package:notely/screens/get_started.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: const MaterialApp(
        title: 'Notely App',
        home: GetStarted(),
      ),
    );
  }
}
