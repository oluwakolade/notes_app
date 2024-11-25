import 'package:flutter/material.dart';
import 'package:notely/constants/text.dart';
import 'package:lottie/lottie.dart';

class NoNotes extends StatelessWidget {
  const NoNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ANIMATION
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Lottie.asset('assets/no_notes.json',
                  repeat: true, reverse: true, animate: true),
            ),
            const Header3(text: "You have no notes yet"),
            const SizedBox(
              height: 20,
            ),
            const Header3(text: "Click the add button to get started"),
          ],
        ),
      ),
    );
  }
}
