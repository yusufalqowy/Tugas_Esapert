import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySkill extends StatelessWidget {
  final String title;
  final int progress;
  final String level;
  MySkill({super.key, required this.title, required this.progress, this.level = ""});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(top: 8),
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: GoogleFonts.rubik(fontSize: 12, fontWeight: FontWeight.bold, height: 1),),
                const Spacer(),
                Text(level, style: GoogleFonts.rubik(fontSize: 12, fontWeight: FontWeight.w200, height: 1),),
              ],
            ),
            const SizedBox(height: 8,),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: LinearProgressIndicator(
                value: (progress / 100),
                minHeight: 8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
