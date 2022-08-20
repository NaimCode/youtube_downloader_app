import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:youtube_downloader/constants/theme.dart';
import 'package:youtube_downloader/widget/loading.dart';

import '../../bloc/video/video_bloc.dart';

class VideoSelectDownload extends StatefulWidget {
  final String url;
  const VideoSelectDownload({Key? key, required this.url}) : super(key: key);

  @override
  State<VideoSelectDownload> createState() => _VideoSelectDownloadState();
}

class _VideoSelectDownloadState extends State<VideoSelectDownload> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        if (state is VideoStateLoading) {
          return const LoadingPage();
        }
        if (state is VideoStateLoaded) {
          final String thumbnail =
              state.videoModel_.video.thumbnails.highResUrl;
          final String title = state.videoModel_.video.title;
          return Scaffold(
              backgroundColor: SECONDARY_LIGHT,
              // appBar: AppBar(
              //   backgroundColor: Colors.transparent,
              //   elevation: 0,
              //   title: Text(
              //     'Choisir le format et qualité',
              //     style: GoogleFonts.merienda(color: Colors.white, fontSize: 18),
              //   ),
              // ),
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: SECONDARY_LIGHT,

                    elevation: 1,
                    // title: Text(
                    //   'Choisir le format et qualité',
                    //   style: GoogleFonts.merienda(
                    //       color: Colors.white, fontSize: 18),
                    // ),
                    floating: false,
                    pinned: true,
                    expandedHeight: 190,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 1000,
                        )
                      ],
                    ),
                  ),
                ],
              ));
        }
        return Container();
      },
    );
  }
}
