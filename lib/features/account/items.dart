import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/widgets/image_item.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35,
          child: ImageItem(
            itemText: "Your Channel",
            itemClicked: () {},
            imageName: "your-channel.png",
            haveColor: false,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 34,
          child: ImageItem(
            itemText: "Turn on Incognito",
            itemClicked: () {},
            imageName: "your-channel.png",
            haveColor: false,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 34,
          child: ImageItem(
            itemText: "Add Account",
            itemClicked: () {},
            imageName: "add-account.png",
            haveColor: false,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 6, bottom: 6),
          child: Divider(
            color: Colors.blueGrey,
          ),
        ),
        SizedBox(
          height: 35,
          child: ImageItem(
            itemText: "Purchases and Membership",
            itemClicked: () {},
            imageName: "purchases.png",
            haveColor: false,
          ),
        ),
        const SizedBox(height: 7),
        SizedBox(
          height: 31,
          child: ImageItem(
            itemText: "Time watched",
            itemClicked: () {},
            imageName: "time-watched.png",
            haveColor: false,
          ),
        ),
        const SizedBox(height: 9),
        SizedBox(
          height: 31,
          child: ImageItem(
            itemText: "Your data in Youtube",
            itemClicked: () {},
            imageName: "your-data.png",
            haveColor: false,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 6, bottom: 6),
          child: Divider(
            color: Colors.blueGrey,
          ),
        ),
        SizedBox(
          height: 33,
          child: ImageItem(
            itemText: "Settings",
            itemClicked: () {},
            imageName: "settings.png",
            haveColor: false,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 35,
          child: ImageItem(
            itemText: "Help & feedback",
            itemClicked: () {},
            imageName: "help.png",
            haveColor: false,
          ),
        ),
      ],
    );
  }
}
