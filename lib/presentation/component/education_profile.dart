import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationProfile extends StatelessWidget {
  final String place;
  final String degree;
  final String year;
  final String major;
  final String school;

  const EducationProfile({super.key, required this.degree, required this.school, required this.place, required this.major, required this.year});

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
            Text("$degree, $major, $year", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
            Text("$school | $place", style: GoogleFonts.rubik(fontWeight: FontWeight.w300, fontSize: 12),),
          ],
        ),
      ),
    );
  }
}
