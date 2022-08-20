// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_downloader/pages/Home/home.dart';

import 'bloc/repository/video_provider.dart';
import 'bloc/video/video_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => VideoBloc(videoService: VideoProvider()),
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
