//SEARCH BAR
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notely/constants/colors.dart';
import 'package:notely/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late final TextEditingController searchController;
  late final NotesProvider noteProvider;

  @override
  void initState() {
    super.initState();
    noteProvider = context.read();

    searchController = TextEditingController()
      ..addListener(() {
        noteProvider.searchQuery = searchController.text;
      });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.bodyText,
      ),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          FontAwesomeIcons.searchengin,
          size: 16,
        ),
        suffixIcon: ListenableBuilder(
          listenable: searchController,
          builder: (context, widget) => searchController.text.isNotEmpty
              ? widget!
              : const SizedBox.shrink(),
          child: InkWell(
            onTap: () {
              searchController.clear();
            },
            child: const Icon(
              FontAwesomeIcons.circleXmark,
            ),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        fillColor: AppColors.offWhite,
        filled: true,
        hintText: "Search...",
        hintStyle: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.bodyText,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.bodyText),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.border),
        ),
      ),
    );
  }
}
