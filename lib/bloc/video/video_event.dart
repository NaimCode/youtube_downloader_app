part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class VideoEventLoadMetaData extends VideoEvent {
  final String url;
  const VideoEventLoadMetaData({required this.url});
}

class VideoOnDownload extends VideoEvent {
  final StreamInfo stream;
  const VideoOnDownload({required this.stream});
}
