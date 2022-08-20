import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../models/video.dart';
import '../repository/video_provider.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoProvider videoService;

  VideoBloc({required this.videoService}) : super(VideoStateInitial()) {
    on<VideoEventLoadMetaData>((event, emit) async {
      emit(VideoStateLoading());
      Video video = await videoService.getVideoMetaData(url: event.url);
      emit(VideoStateLoaded(videoModel_: VideoModel(video: video)));
    });
  }
}
