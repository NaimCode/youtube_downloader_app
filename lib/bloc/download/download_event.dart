part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();

  @override
  List<Object> get props => [];
}

class DownloadStart extends DownloadEvent {
  final StreamInfo stream;
  final String fileName;
  final String ext;
  const DownloadStart(
      {required this.stream, required this.fileName, required this.ext});
}
