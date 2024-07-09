import 'package:flutter/material.dart';
import 'package:youtube_clone/features/content/Long_video/long_video_screen.dart';
import 'package:youtube_clone/features/content/short_video/pages/short_video_page.dart';
import 'package:youtube_clone/features/search/pages/search_screen.dart';

List pages = const [
  SearchScreen(),
  LongVideoScreen(),
  ShortVideoPage(),
  Center(
    child: Text("upload"),
  ),
  Center(
    child: Text("Home"),
  ),
  Center(
    child: Text("Home"),
  ),
];
