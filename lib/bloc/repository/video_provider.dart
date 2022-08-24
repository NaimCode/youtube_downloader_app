import 'dart:async';

import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoProvider {
  YoutubeExplode yt;
  VideoProvider({required this.yt});
  Future<Video> getVideoMetaData({required String url}) =>
      yt.videos.get("https://www.youtube.com/watch?v=CYfE21WsKm4");

  Future<StreamManifest> getVideoManifest({required String id}) =>
      yt.videos.streamsClient.getManifest(id);

  Stream<List<int>> getStreamDownload({required StreamInfo stream}) =>
      yt.videos.streamsClient.get(stream);
}


//const db=Firestore.instance
//db.collection('videos').getDocuments();