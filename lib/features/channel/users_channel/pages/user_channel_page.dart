import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';

class UserChannelPage extends StatefulWidget {
  const UserChannelPage({super.key});

  @override
  State<UserChannelPage> createState() => _UserChannelPageState();
}

class _UserChannelPageState extends State<UserChannelPage> {
  bool haveVideos = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/flutter background.png",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "A.D",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "@alper1",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(text: "No subscriptions  "),
                              TextSpan(text: "No Videos"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
              child: FlatButton(
                text: "SUBSCRIBE",
                onPressed: () {},
                color: Colors.black,
              ),
            ),
            haveVideos
                ? SizedBox()
                : Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 0.2),
                      child: const Text(
                        "No Video",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
