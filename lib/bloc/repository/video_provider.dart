import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoProvider {
  YoutubeExplode yt = YoutubeExplode();
  Future<Video> getVideoMetaData({required String url}) async {
    return yt.videos.get(
        "https://www.youtube.com/watch?v=0e_oa115u3Y&ab_channel=Na%C3%AFmAbdelkerim");
  }

  Future<StreamManifest> getVideoManifest({required String id}) {
    return yt.videos.streamsClient.getManifest(id);
  }
}
