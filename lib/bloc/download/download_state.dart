part of 'download_bloc.dart';

abstract class DownloadState extends Equatable {
  const DownloadState();

  @override
  List<Object> get props => [];
}

class DownloadInitial extends DownloadState {}

class DownloadInProgress extends DownloadState {
  final int progress;
  const DownloadInProgress({required this.progress});
  @override
  List<Object> get props => [progress];
}
