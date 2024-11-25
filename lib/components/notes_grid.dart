//NOTE GRID
import 'package:flutter/material.dart';
import 'package:notely/components/notes_card.dart';
import 'package:notely/models/note_model.dart';

class NoteGrid extends StatelessWidget {
  final List<Notes> notes;

  const NoteGrid({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (context, int index) {
        return NotesCard(
          isGrid: true,
          note: notes[index],
        );
      },
      itemCount: notes.length,
    );
  }
}
