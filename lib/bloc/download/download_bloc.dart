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

      File file = File(dir.path);
      IOSink fileStream = file.openWrite();

      await videoProvider.getStreamDownload(stream: event.stream).listen(
          (data) {
        print('---');
        fileStream.add(data);
      }, onDone: () {
        print('Done');
      }, onError: (error) {
        print(error);
      }).asFuture();
    });
  }
}
