import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
