import 'package:flutter/material.dart';
import 'package:youtube_ui/Models/data.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Image.network(
            video.thumbnailUrl,
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: 8.0,
            bottom: 8.0,
            child: Container(
              padding: EdgeInsets.all(4),
              color: Colors.black,
              child: Text(
                video.duration,
                style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      Row(children: [
        
      ],)
    ]);
  }
}
