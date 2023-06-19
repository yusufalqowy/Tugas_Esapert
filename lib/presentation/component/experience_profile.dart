import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceProfile extends StatelessWidget {
  final String place;
  final String task;
  final String year;
  final String position;
  final String company;

  const ExperienceProfile({super.key, required this.position, required this.year, required this.company, required this.place, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(top: 8),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$position | $year", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
            Text("$company, $place", style: GoogleFonts.rubik(fontWeight: FontWeight.w300, fontSize: 12),),
            const SizedBox(height: 8,),
            Text(task, textAlign: TextAlign.justify, style: GoogleFonts.rubik(fontWeight: FontWeight.w200, fontSize: 11 ),),
          ],
        ),
      ),
    );
  }
}
