import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_downloader/bloc/download/download_bloc.dart';
import 'package:youtube_downloader/constants/theme.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MuxedItem extends StatelessWidget {
  final MuxedStreamInfo muxed;
  late final bool isMp3;
  MuxedItem({Key? key, required this.muxed}) : super(key: key) {
    isMp3 = muxed.container.name != "mp4";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        tileColor: Colors.white,
        style: ListTileStyle.list,
        shape: Border.all(color: Colors.white, width: 1),
        textColor: Colors.black,
        title: Text(muxed.qualityLabel),
        trailing: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(primary: PRIMARY, elevation: 0),
            onPressed: () {
              BlocProvider.of<DownloadBloc>(context).add(DownloadStart(
                  ext: isMp3 ? ".mp3" : ".mp4",
                  stream: muxed,
                  fileName: context.read<String>()));
            },
            icon: const Icon(Icons.download_outlined),
            label: Text(muxed.size.toString())),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: isMp3 ? Colors.yellow : Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  isMp3 ? "mp3" : muxed.container.toString(),
                  style: GoogleFonts.acme(color: Colors.black, fontSize: 12),
                )),
          ],
        ),
        leading: CircleAvatar(
          child: Icon(isMp3 ? Icons.music_note : Icons.play_arrow),
        ),
      ),
    );
  }
}
