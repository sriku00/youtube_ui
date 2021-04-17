import 'package:flutter/material.dart';
import 'package:youtube_ui/Models/data.dart';
import 'package:youtube_ui/Widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CustomSliverAppBar(),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 60),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final video = videos[index];
              return VideoCard(video: video);
            }, childCount: videos.length),
          ),
        )
      ],
    ));
  }
}
