part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();

  @override
  List<Object> get props => [];
}

class DownloadStart extends DownloadEvent {
  final StreamInfo stream;
  const DownloadStart({required this.stream});
}
