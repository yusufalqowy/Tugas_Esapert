import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactItem extends StatelessWidget {
  final ImageProvider icon;
  final String title;
  final String description;
  String linkContact = "";

  ContactItem({super.key, required this.icon, required this.title, required this.description, this.linkContact = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.onSurface),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          splashFactory: linkContact.isEmpty ? NoSplash.splashFactory : InkRipple.splashFactory,
          backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.surface),
          elevation: const MaterialStatePropertyAll(1)
        ),
        onPressed: _onPressed(),
        child: Row(
          children: [
            Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageIcon(icon, color: Theme.of(context).colorScheme.primary,),
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                      description,
                      style: GoogleFonts.rubik(fontWeight: FontWeight.w200, fontSize: 11)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  VoidCallback? _onPressed() {
    if(linkContact.isNotEmpty){
      return (){
        launchUrlString(linkContact, mode: LaunchMode.externalApplication);
      };
    }else{
      return null;
    }
  }

}
