import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notely/constants/colors.dart';

class NoteToolBar extends StatelessWidget {
  final QuillController controller;
  const NoteToolBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        border: Border.all(
            color: AppColors.border,
            strokeAlign: BorderSide.strokeAlignOutside),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: QuillToolbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              QuillToolbarHistoryButton(
                controller: controller,
                isUndo: true,
                options: const QuillToolbarHistoryButtonOptions(
                  iconData: FontAwesomeIcons.arrowRotateLeft,
                ),
              ),
              QuillToolbarHistoryButton(
                controller: controller,
                isUndo: false,
                options: const QuillToolbarHistoryButtonOptions(
                  iconData: FontAwesomeIcons.arrowRotateRight,
                ),
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.bold,
                options: const QuillToolbarToggleStyleButtonOptions(
                  iconData: FontAwesomeIcons.bold,
                ),
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.italic,
                options: const QuillToolbarToggleStyleButtonOptions(
                  iconData: FontAwesomeIcons.italic,
                ),
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.underline,
                options: const QuillToolbarToggleStyleButtonOptions(
                  iconData: FontAwesomeIcons.underline,
                ),
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.strikeThrough,
                options: const QuillToolbarToggleStyleButtonOptions(
                  iconData: FontAwesomeIcons.strikethrough,
                ),
              ),
              QuillToolbarColorButton(
                controller: controller,
                isBackground: false,
                options: const QuillToolbarColorButtonOptions(
                  iconData: FontAwesomeIcons.palette,
                ),
              ),
              QuillToolbarColorButton(
                controller: controller,
                isBackground: true,
                options: const QuillToolbarColorButtonOptions(
                  iconData: FontAwesomeIcons.fillDrip,
                ),
              ),
              QuillToolbarClearFormatButton(
                controller: controller,
                options: const QuillToolbarClearFormatButtonOptions(
                  iconData: FontAwesomeIcons.textSlash,
                ),
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.ol,
                options: const QuillToolbarToggleStyleButtonOptions(
                  iconData: FontAwesomeIcons.listOl,
                ),
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.ul,
                options: const QuillToolbarToggleStyleButtonOptions(
                  iconData: FontAwesomeIcons.listUl,
                ),
              ),
              QuillToolbarSearchButton(
                controller: controller,
                options: const QuillToolbarSearchButtonOptions(
                  iconData: FontAwesomeIcons.magnifyingGlass,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}











// QuillToolbar.simple(
//         configurations: const QuillSimpleToolbarConfigurations(
          
//           //QUILLTOLLBAR PALLETE
//           multiRowsDisplay: false,
//           showFontFamily: false,
//           showFontSize: false,
//           showSubscript: false,
//           showSuperscript: false,
//           showSmallButton: false,
//           showInlineCode: false,
//           showAlignmentButtons: false,
//           showDirection: false,
//           showHeaderStyle: false,
//           showDividers: false,
//           showListCheck: false,
//           showCodeBlock: false,
//           showQuote: false,
//           showIndent: false,
//           showLink: false,
//           //ICON STYLES
//           buttonOptions: QuillSimpleToolbarButtonOptions(
//             undoHistory: QuillToolbarHistoryButtonOptions(
//                 iconData: FontAwesomeIcons.arrowRotateLeft, iconSize: 20),
//             redoHistory: QuillToolbarHistoryButtonOptions(
//                 iconData: FontAwesomeIcons.arrowRotateRight, iconSize: 20),
//             italic: QuillToolbarToggleStyleButtonOptions(
//                 iconData: FontAwesomeIcons.italic, iconSize: 20),
//             underLine: QuillToolbarToggleStyleButtonOptions(
//                 iconData: FontAwesomeIcons.underline, iconSize: 20),
//             strikeThrough: QuillToolbarToggleStyleButtonOptions(
//                 iconData: FontAwesomeIcons.strikethrough, iconSize: 20),
//             color: QuillToolbarColorButtonOptions(
//                 iconData: FontAwesomeIcons.palette, iconSize: 20),
//             backgroundColor: QuillToolbarColorButtonOptions(
//                 iconData: FontAwesomeIcons.fillDrip, iconSize: 20),
//             clearFormat: QuillToolbarClearFormatButtonOptions(
//                 iconData: FontAwesomeIcons.textSlash, iconSize: 20),
//             listNumbers: QuillToolbarToggleStyleButtonOptions(
//                 iconData: FontAwesomeIcons.listOl, iconSize: 20),
//             listBullets: QuillToolbarToggleStyleButtonOptions(
//                 iconData: FontAwesomeIcons.listUl, iconSize: 20),
//             search: QuillToolbarSearchButtonOptions(
//                 iconData: FontAwesomeIcons.magnifyingGlass, iconSize: 20),
//           ),
//         ),
//       ),