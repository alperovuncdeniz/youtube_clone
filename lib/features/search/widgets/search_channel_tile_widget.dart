// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:youtube_clone/cores/widgets/flat_button.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';
import 'package:youtube_clone/features/channel/users_channel/pages/user_channel_page.dart';
import 'package:youtube_clone/features/channel/users_channel/subscribe_repository.dart';

class SearchChannelTile extends ConsumerWidget {
  final UserModel user;
  const SearchChannelTile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserChannelPage(userId: user.userId),
            ),
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              backgroundImage: CachedNetworkImageProvider(user.profilePic),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.displayName,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "@${user.username}",
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "${user.subscriptions.length.toString()} Subscribe",
                    style: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 33,
                    width: 110,
                    child: FlatButton(
                      text: "Subscribe",
                      onPressed: () async {
                        await ref
                            .watch(subscribeChannelProvider)
                            .subscribeChannel(
                              userId: user.userId,
                              currentUserId:
                                  FirebaseAuth.instance.currentUser!.uid,
                              subscriptions: user.subscriptions,
                            );
                      },
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
