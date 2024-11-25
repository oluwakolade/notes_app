//NOTE LIST
import 'package:flutter/material.dart';
import 'package:notely/components/notes_card.dart';
import 'package:notely/models/note_model.dart';

class NoteList extends StatelessWidget {
  final List<Notes> notes;

  const NoteList({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, int index) {
        return NotesCard(
          note: notes[index],
          isGrid: false,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: notes.length,
    );
  }
}
