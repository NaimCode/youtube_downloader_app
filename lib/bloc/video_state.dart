part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoStateInitial extends VideoState {}

class VideoStateLoading extends VideoState {}

class VideoStateLoaded extends VideoState {
  final VideoModel videoModel_;
  const VideoStateLoaded({required this.videoModel_});

  VideoModel get videoModel => videoModel_;
  @override
  List<Object> get props => [];
}
