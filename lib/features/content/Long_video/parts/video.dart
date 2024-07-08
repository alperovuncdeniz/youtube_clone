// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader_page.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/content/Long_video/parts/post.dart';
import 'package:youtube_clone/features/content/Long_video/widgets/video_externel_buttons.dart';
import 'package:youtube_clone/features/content/comment/comment_sheet.dart';
import 'package:youtube_clone/features/upload/long_video/video_model.dart';

class Video extends ConsumerStatefulWidget {
  final VideoModel video;
  const Video({
    super.key,
    required this.video,
  });

  @override
  ConsumerState<Video> createState() => _VideoState();
}

class _VideoState extends ConsumerState<Video> {
  bool isShowIcons = false;
  bool isPlaying = false;
  VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.video.videoUrl),
    )..initialize().then(
        (_) {
          setState(() {});
        },
      );
  }

  toogleVideoPlayer() {
    if (_controller!.value.isPlaying) {
      _controller!.pause();
      isPlaying = false;
      setState(() {});
    } else {
      _controller!.play();
      isPlaying = true;
      setState(() {});
    }
  }

  goBackward() {
    Duration position = _controller!.value.position;
    position = position - const Duration(seconds: 1);
    _controller!.seekTo(position);
  }

  goForward() {
    Duration position = _controller!.value.position;
    position = position + const Duration(seconds: 1);
    _controller!.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<UserModel> user =
        ref.watch(anyUserDataProvider(widget.video.userId));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(176),
          child: _controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: GestureDetector(
                    onTap: isShowIcons
                        ? () {
                            isShowIcons = false;
                            setState(() {});
                          }
                        : () {
                            isShowIcons = true;
                            setState(() {});
                          },
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        ),
                        isShowIcons
                            ? Positioned(
                                left: 170,
                                top: 92,
                                child: GestureDetector(
                                  onTap: toogleVideoPlayer,
                                  child: SizedBox(
                                    height: 50,
                                    child: Image.asset(
                                      "assets/images/play.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        isShowIcons
                            ? Positioned(
                                left: 48,
                                top: 94,
                                child: GestureDetector(
                                  onTap: goBackward,
                                  child: SizedBox(
                                    height: 50,
                                    child: Image.asset(
                                      "assets/images/go_back_final.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        isShowIcons
                            ? Positioned(
                                right: 55,
                                top: 93,
                                child: GestureDetector(
                                  onTap: goForward,
                                  child: SizedBox(
                                    height: 50,
                                    child: Image.asset(
                                      "assets/images/go ahead final.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: 7.5,
                            child: VideoProgressIndicator(
                              _controller!,
                              allowScrubbing: true,
                              colors: const VideoProgressColors(
                                playedColor: Colors.red,
                                bufferedColor: Colors.grey,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(bottom: 100),
                  child: LoaderPage(),
                ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13, top: 4),
              child: Text(
                widget.video.title,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7, top: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 4),
                    child: Text(
                      widget.video.views == 0
                          ? "No view"
                          : "${widget.video.views} views",
                      style: const TextStyle(
                        fontSize: 13.4,
                        color: Color(0xff5F5F5F),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 4, right: 8),
                    child: Text(
                      "5 minutes ago",
                      style: TextStyle(
                        fontSize: 13.4,
                        color: Color(0xff5F5F5F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 9, right: 9),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey,
                    backgroundImage:
                        CachedNetworkImageProvider(user.value!.profilePic),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Text(
                      user.value!.displayName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6, left: 6),
                    child: Text(
                      user.value!.subscriptions.isEmpty
                          ? "No Subscription"
                          : "${user.value!.subscriptions.length} Subscriptions",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 35,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: FlatButton(
                        text: "Subscribe",
                        onPressed: () {},
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9, top: 10.5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 6),
                      decoration: const BoxDecoration(
                        color: softBlueGreyBackGround,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.thumb_up,
                              size: 15.5,
                            ),
                          ),
                          const SizedBox(width: 19),
                          const Icon(
                            Icons.thumb_down,
                            size: 15.5,
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 9, right: 9),
                      child: VideoExtraButtons(
                        text: "Share",
                        iconData: Icons.share,
                      ),
                    ),
                    const VideoExtraButtons(
                      text: "Remix",
                      iconData: Icons.analytics_outlined,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 9, right: 9),
                      child: VideoExtraButtons(
                        text: "Download",
                        iconData: Icons.download,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => CommentSheet(
                      video: widget.video,
                    ),
                  );
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  width: 200,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("videos")
                    .where("videoId", isNotEqualTo: widget.video.videoId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return const ErrorPage();
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const LoaderPage();
                  }
                  final videosMap = snapshot.data!.docs;
                  final videos = videosMap
                      .map((video) => VideoModel.fromMap(video.data()))
                      .toList();
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      return Post(video: videos[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
