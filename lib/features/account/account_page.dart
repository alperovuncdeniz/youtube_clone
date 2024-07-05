import 'package:flutter/material.dart';
import 'package:youtube_clone/features/account/items.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Items(),
        ],
      ),
    );
  }
}
