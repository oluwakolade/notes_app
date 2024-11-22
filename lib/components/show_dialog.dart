import 'package:flutter/material.dart';
import 'package:notely/components/notes_dialog.dart';

Future<bool?> showConfirmationDialog(
    {required BuildContext context, required String text}) {
  return showDialog(
    context: context,
    builder: (_) => NotesDialog(text: text),
  );
}
