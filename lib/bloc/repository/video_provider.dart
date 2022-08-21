import 'dart:async';

import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoProvider {
  YoutubeExplode yt;
  VideoProvider({required this.yt});
  Future<Video> getVideoMetaData({required String url}) => yt.videos.get(
      "https://www.youtube.com/watch?v=0e_oa115u3Y&ab_channel=Na%C3%AFmAbdelkerim");

  Future<StreamManifest> getVideoManifest({required String id}) =>
      yt.videos.streamsClient.getManifest(id);

  Stream<List<int>> getStreamDownload({required StreamInfo stream}) =>
      yt.videos.streamsClient.get(stream);
}
