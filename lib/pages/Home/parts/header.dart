import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_downloader/constants/theme.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Text(
        'Télécharger à partir de YouTube',
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontSize: 30,
          fontFamily: GoogleFonts.merienda().fontFamily,
          fontWeight: FontWeight.bold,
          shadows: <Shadow>[
            const Shadow(
              offset: Offset(0.0, 1.0),
              blurRadius: 1.0,
              color: Color.fromARGB(87, 0, 0, 0),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                SECONDARY.withOpacity(.6),
                SECONDARY.withOpacity(.8),
              ]),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Text(
          'Il vous suffit de copier l\'URL de la vidéo pour la télécharger en format MP4 ou MP3.',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.white,
            fontFamily: GoogleFonts.ptSerif().fontFamily,
            shadows: <Shadow>[
              const Shadow(
                offset: Offset(0.0, 1.0),
                blurRadius: 1.0,
                color: Color.fromARGB(17, 0, 0, 0),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }
}
