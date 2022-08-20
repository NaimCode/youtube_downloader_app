import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _urlController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _urlController.dispose();
    _formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: const Color(0xFF274f69).withOpacity(.6),
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
                )
              ],
            ),
          ),
        ));
  }
}

//ReKDJMI8dNQ
