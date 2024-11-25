import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notely/components/app_bar.dart';
import 'package:notely/components/note_tool_bar.dart';
import 'package:notely/components/show_dialog.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/constants/text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notely/provider/new_note_provider.dart';
import 'package:provider/provider.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key, required this.isNewNote});

  final bool isNewNote;

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  late final QuillController quillController;
  late final TextEditingController titleController;
  late final FocusNode focusNode;
  late final NewNoteProvider newNoteProvider;

  @override
  void initState() {
    super.initState();

    newNoteProvider = context.read<NewNoteProvider>();
    titleController = TextEditingController(text: newNoteProvider.title);
    quillController = QuillController.basic()
      ..addListener(() {
        newNoteProvider.content = quillController.document;
      });
    focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.isNewNote) {
        focusNode.requestFocus();
        newNoteProvider.readOnly = false;
      } else {
        newNoteProvider.readOnly = true;
        quillController.document = newNoteProvider.content;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    quillController.dispose();
    focusNode.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (!newNoteProvider.canSaveNote) {
          Navigator.of(context).pop();
          return;
        }
        final bool? shouldSaveNote = await showConfirmationDialog(
            context: context, text: "Do you want to save the note?");

        if (shouldSaveNote == null) return;

        if (!context.mounted) return;
        if (shouldSaveNote) {
          newNoteProvider.saveNote(context);
        }
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: NotesAppBar(
          widget: Header4(text: widget.isNewNote ? "New Note" : "Edit note"),
          prefix: IconButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            icon: const Icon(FontAwesomeIcons.chevronLeft),
          ),
          suffix: Selector<NewNoteProvider, bool>(
            selector: (context, newNoteProvider) => newNoteProvider.readOnly,
            builder: (context, readOnly, child) => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    newNoteProvider.readOnly = !readOnly;

                    if (newNoteProvider.readOnly) {
                      FocusScope.of(context).unfocus();
                    } else {
                      focusNode.requestFocus();
                    }
                  },
                  icon: Icon(
                      readOnly ? FontAwesomeIcons.pen : FontAwesomeIcons.book),
                ),
                Selector<NewNoteProvider, bool>(
                  selector: (_, newNoteProvider) => newNoteProvider.canSaveNote,
                  builder: (_, canSaveNote, __) => IconButton(
                    onPressed: canSaveNote
                        ? () {
                            newNoteProvider.saveNote(context);
                            Navigator.of(context).pop();
                          }
                        : null,
                    icon: const Icon(FontAwesomeIcons.floppyDisk),
                  ),
                ),
              ],
            ),
          ),
        ),

        //NOTES BODY
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              //TITLE TEXTFIELD
              Selector<NewNoteProvider, bool>(
                selector: (context, controller) => controller.readOnly,
                builder: (context, readOnly, child) => TextFormField(
                  controller: titleController,
                  style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: AppColors.bodyText),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  canRequestFocus: !readOnly,
                  onChanged: (newValue) {
                    newNoteProvider.title = newValue;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //NOTE BODY
              Expanded(
                child: QuillEditorProvider(
                  controller: quillController,
                  child: Selector<NewNoteProvider, bool>(
                    selector: (_, controller) => controller.readOnly,
                    builder: (_, readOnly, __) => Column(
                      children: [
                        //QUILL TEXT EDITOR
                        Expanded(
                          child: QuillEditor.basic(
                            controller: quillController,
                            configurations: QuillEditorConfigurations(
                              placeholder: "Note here",
                              expands: true,
                              checkBoxReadOnly: readOnly,
                              scrollable: true,
                            ),
                            focusNode: focusNode,
                          ),
                        ),

                        if (!readOnly)
                          NoteToolBar(
                            controller: quillController,
                          )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
