import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoService {
  Future<Video> getVideoMetaData({required String url}) async {
    YoutubeExplode yt = YoutubeExplode();
    return yt.videos.get("https://www.youtube.com/watch?v=YqrYtBqp2kU");
  }
}
