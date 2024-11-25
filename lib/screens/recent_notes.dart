import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notely/components/app_bar.dart';
import 'package:notely/components/no_notes.dart';
import 'package:notely/components/notes_grid.dart';
import 'package:notely/components/notes_list.dart';
import 'package:notely/components/search_bar.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/constants/text.dart';
import 'package:notely/models/note_model.dart';
import 'package:notely/provider/new_note_provider.dart';
import 'package:notely/provider/notes_provider.dart';
import 'package:notely/screens/add_new_note.dart';
import 'package:provider/provider.dart';

class RecentNotes extends StatefulWidget {
  const RecentNotes({super.key});

  @override
  State<RecentNotes> createState() => _RecentNotesState();
}

class _RecentNotesState extends State<RecentNotes> {
  List<Notes> notes = List.empty(growable: true);

  bool isGrid = true;

  void logUsersOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: NotesAppBar(
          widget: const Header4(text: "Recent Notes"),
          prefix: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.chevron_left),
          ),
          suffix: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                },
                icon: Icon(isGrid ? Icons.table_chart : Icons.table_rows),
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: logUsersOut,
                icon: const Icon(FontAwesomeIcons.arrowRightFromBracket),
              ),
            ],
          )),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => NewNoteProvider(),
                child: const NewNote(
                  isNewNote: true,
                ),
              ),
            ),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.accent,
        child: const Icon(
          Icons.note_add,
          color: AppColors.offWhite,
        ),
      ),

      //BODY SHOWING NOTES AND SEARCH BAR
      body: Consumer<NotesProvider>(builder: (context, noteProvider, child) {
        final List<Notes> notes = noteProvider.notes;

        return notes.isEmpty && noteProvider.searchQuery.isEmpty
            //IF NO NOTES
            ? const NoNotes()
            //WHEN NOTES IS ADDED
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    //SEARCH BAR
                    const AppSearchBar(),
                    const SizedBox(
                      height: 10,
                    ),
                    if (notes.isNotEmpty) ...[
                      //NOTES GRID/LIST
                      Expanded(
                        child: isGrid
                            ? NoteGrid(
                                notes: notes,
                              )
                            : NoteList(
                                notes: notes,
                              ),
                      ),
                    ] else
                      //add animation
                      const Expanded(
                        child: Center(
                          child: Header3(text: "No notes found!"),
                        ),
                      )
                  ],
                ),
              );
      }),
    );
  }
}
