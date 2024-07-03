import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';

class MyChannelScreen extends StatelessWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 4),
                  child: Text(
                    "Alper1",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.blueGrey),
                      children: [
                        TextSpan(text: "@alper1  "),
                        TextSpan(text: "No subscriptions  "),
                        TextSpan(text: "No videos"),
                      ],
                    ),
                  ),
                ),
                const Text("More about this channel"),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 41,
                          decoration: const BoxDecoration(
                            color: softBlueGreyBackGround,
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Manage Videos",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ImageButton(
                          onPressed: () {},
                          image: "pen.png",
                          haveColor: true,
                        ),
                      ),
                      Expanded(
                        child: ImageButton(
                          onPressed: () {},
                          image: "time-watched.png",
                          haveColor: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 14),
                  child: TabBar(
                    isScrollable: true,
                    labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.only(top: 12),
                    tabs: [
                      Text("Home"),
                      Text("Videos"),
                      Text("shorts"),
                      Text("community"),
                      Text("playlist"),
                      Text("channels"),
                      Text("about"),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      Center(
                        child: Text("Home"),
                      ),
                      Center(
                        child: Text("Videos"),
                      ),
                      Center(
                        child: Text("shorts"),
                      ),
                      Center(
                        child: Text("community"),
                      ),
                      Center(
                        child: Text("playlists"),
                      ),
                      Center(
                        child: Text("channel"),
                      ),
                      Center(
                        child: Text("about"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
