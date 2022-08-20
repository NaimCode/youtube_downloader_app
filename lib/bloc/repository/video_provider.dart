import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoProvider {
  Future<Video> getVideoMetaData({required String url}) async {
    YoutubeExplode yt = YoutubeExplode();
    return yt.videos.get(url);
  }
}
