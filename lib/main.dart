// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:youtube_downloader/pages/Home/home.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import 'bloc/download/download_bloc.dart';
import 'bloc/repository/video_provider.dart';
import 'bloc/video/video_bloc.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('test');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final YoutubeExplode yt = YoutubeExplode();
  @override
  void dispose() {
    super.dispose();
    yt.close();
  }

  void requestPermission() async {
    await Permission.storage.request();

    var status = await Permission.storage.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    }
    print(status);
    // You can can also directly ask the permission about its status.
  }

  @override
  Widget build(BuildContext context) {
    requestPermission();
    return MultiBlocProvider(
        providers: [
          BlocProvider<VideoBloc>(
              create: (context) =>
                  VideoBloc(videoService: VideoProvider(yt: yt))),
          BlocProvider<DownloadBloc>(
              create: (context) =>
                  DownloadBloc(videoProvider: VideoProvider(yt: yt))),
        ],
        child: MaterialApp(
            title: 'Youtube Downloader',
            theme: ThemeData(
              primarySwatch: Colors.purple,
            ),
            debugShowCheckedModeBanner: false,
            home: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg_1.jpeg'), fit: BoxFit.cover),
              ),
              child: const Home(),
            )));
  }
}
