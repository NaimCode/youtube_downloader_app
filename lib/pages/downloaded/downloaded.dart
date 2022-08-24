import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:youtube_downloader/constants/theme.dart';

class Downloaded extends StatefulWidget {
  const Downloaded({Key? key}) : super(key: key);

  @override
  State<Downloaded> createState() => _DownloadedState();
}

class _DownloadedState extends State<Downloaded> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
        valueListenable: Hive.box('test').listenable(),
        builder: (context, box, widget) {
          print(box.values);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('Téléchargements'),
            ),
            backgroundColor: SECONDARY_LIGHT,
            body: Center(
              child: Text(
                box.values.length.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          );
        });
  }
}
