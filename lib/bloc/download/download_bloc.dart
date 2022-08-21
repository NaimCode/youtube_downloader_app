// ignore_for_file: avoid_print

import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../repository/video_provider.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final VideoProvider videoProvider;
  DownloadBloc({required this.videoProvider}) : super(DownloadInitial()) {
    on<DownloadStart>((event, emit) async {
      Directory dir = await getApplicationDocumentsDirectory();

      File file =
          File("${dir.path}/${event.fileName.split(" ")[0]}${event.ext}");
      IOSink fileStream = file.openWrite();

      var result = await videoProvider
          .getStreamDownload(stream: event.stream)
          .pipe(fileStream);
      print(result);
    });
  }
}
