import 'package:flutter/material.dart';
import 'package:youtube_downloader/pages/Home/parts/header.dart';
import 'package:youtube_downloader/pages/Home/parts/input.dart';

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
                const Header(),
                Expanded(
                    child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 50,
                    ),
                    Input(),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}

//ReKDJMI8dNQ
