import 'package:flutter/material.dart';
import 'package:notely/constants/text.dart';

class NoNotes extends StatelessWidget {
  const NoNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ANIMATION
            Header3(text: "You have no notes yet"),
            SizedBox(
              height: 20,
            ),
            Header3(text: "Click the '+' button to get started"),
          ],
        ),
      ),
    );
  }
}
