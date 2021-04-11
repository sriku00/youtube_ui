import 'package:flutter/material.dart';
import 'package:youtube_ui/Models/data.dart';

class CustomSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Image.asset("assets/logos/youtube.png"),
      ),
      actions: [
        IconButton(icon: const Icon(Icons.cast), onPressed: () {}),
        IconButton(icon: Icon(Icons.notifications_outlined), onPressed: () {}),
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(
            iconSize: 40,
            icon: CircleAvatar(foregroundImage: NetworkImage(currentUser.profileImageUrl)),
            onPressed: () {}),
      ],
    );
  }
}
