// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:youtube_downloader/pages/home.dart';
import 'package:youtube_downloader/services/video_service.dart';

import 'bloc/video_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => VideoBloc(videoService: VideoService()),
        child: MaterialApp(
          title: 'Youtube Downloader',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Lottie.asset('assets/lotties/background.json',
                    fit: BoxFit.cover),
              ),
              const Home()
            ],
          )),
        ));
  }
}
