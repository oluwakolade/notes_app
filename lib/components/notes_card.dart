import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:notely/components/show_dialog.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/constants/text.dart';
import 'package:notely/models/note_model.dart';
import 'package:notely/provider/new_note_provider.dart';
import 'package:notely/provider/notes_provider.dart';
import 'package:notely/screens/add_new_note.dart';
import 'package:provider/provider.dart';
//notes grid

class NotesCard extends StatelessWidget {
  final Notes note;
  final bool isGrid;

  const NotesCard({super.key, required this.note, required this.isGrid});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => NewNoteProvider()..note = note,
              child: const NewNote(isNewNote: false),
            ),
          ),
        );
      },
      onLongPress: () async {
        final shouldDelete = await showConfirmationDialog(
                context: context, text: "Do you want to delete the note?") ??
            false;
        if (shouldDelete && context.mounted) {
          context.read<NotesProvider>().deleteNote(note);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.offWhite,
          border: Border.all(color: AppColors.border, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //TITLE
          children: [
            if (note.title != null) ...[
              Text(
                note.title.toString(),
                style: GoogleFonts.nunito(
                    color: AppColors.headerText,
                    fontSize: 16,
                    fontWeight: FontWeight.w900),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
            ],

            //CONTENT
            if (note.body != null)
              Text(
                note.body.toString(),
                style: GoogleFonts.nunito(
                    color: AppColors.bodyText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

            isGrid
                ? const Expanded(
                    child: SizedBox(),
                  )
                : const SizedBox(
                    height: 10,
                  ),
            //DATE
            Header5(
              text: DateFormat('yMd').format(
                DateTime.fromMicrosecondsSinceEpoch(note.date),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//notes list