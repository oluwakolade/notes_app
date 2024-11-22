import 'package:flutter/material.dart';
import 'package:notely/models/note_model.dart';

class NotesProvider extends ChangeNotifier {
  final List<Notes> _notes = [];

  List<Notes> get notes => [
        ..._searchQuery.isEmpty
            ? _notes
            : _notes.where(
                _test,
              )
      ];

  bool _test(Notes note) {
    final query = _searchQuery.toLowerCase().trim();
    final title = note.title?.toLowerCase() ?? '';
    final body = note.body?.toLowerCase() ?? '';
    return title.contains(query) || body.contains(query);
  }

  void addNote(Notes note) {
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(Notes note) {
    final index = _notes.indexWhere((element) => element.date == note.date);
    _notes[index] = note;
    notifyListeners();
  }

  void deleteNote(Notes notes) {
    _notes.remove(notes);
    notifyListeners();
  }

  String _searchQuery = '';
  set searchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  String get searchQuery => _searchQuery;
}
