import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:notely/models/note_model.dart';
import 'package:notely/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class NewNoteProvider extends ChangeNotifier {
  Notes? _note;
  set note(Notes? value) {
    _note = value;
    _title = _note!.title ?? '';
    _content = Document.fromJson(jsonDecode(_note!.contentJson));
    notifyListeners();
  }

  Notes? get note => _note;

  bool _readOnly = false;
  set readOnly(bool value) {
    _readOnly = value;
    notifyListeners();
  }

  bool get readOnly => _readOnly;

  String _title = '';

  set title(String value) {
    _title = value;
    notifyListeners();
  }

  String get title => _title.trim();

  Document _content = Document();
  set content(Document value) {
    _content = value;
    notifyListeners();
  }

  Document get content => _content;

  bool get isNewNote => _note == null;

  bool get canSaveNote {
    final String? newTitle = title.isNotEmpty ? title : null;
    final String? newContent = content.toPlainText().trim().isNotEmpty
        ? content.toPlainText().trim()
        : null;

    bool canSave = newTitle != null || newContent != null;
    if (!isNewNote) {
      final newContentJson = jsonEncode(content.toDelta().toJson());
      canSave = canSave &&
          (newTitle != note!.title || newContentJson != note!.contentJson);
    }

    return canSave;
  }

//save note
  void saveNote(BuildContext context) {
    final String? newTitle = title.isNotEmpty ? title : null;
    final String? newContent = content.toPlainText().trim().isNotEmpty
        ? content.toPlainText().trim()
        : null;
    final String contentJson = jsonEncode(_content.toDelta().toJson());
    final int now = DateTime.now().microsecondsSinceEpoch;
    final Notes note = Notes(
        title: newTitle, body: newContent, contentJson: contentJson, date: now);

    final notesProvider = context.read<NotesProvider>();
    isNewNote ? notesProvider.addNote(note) : notesProvider.updateNote(note);
  }
}
