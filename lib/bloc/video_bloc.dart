import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/video.dart';
import '../services/video_service.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoService videoService;

  VideoBloc({required this.videoService}) : super(VideoStateInitial()) {
    on<VideoEventLoadMetaData>((event, emit) {
      emit(VideoStateLoading());
      videoService.getVideoMetaData(url: event.url).then((video) {
        emit(VideoStateLoaded(videoModel_: VideoModel(video: video)));
      });
    });
  }
}
