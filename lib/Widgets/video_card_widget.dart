import 'package:flutter/material.dart';
import 'package:youtube_ui/Models/data.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_ui/Screens/nave_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read(selectedvideoProvider).state = video;
      },
      child: Column(children: [
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage(video.author.profileImageUrl),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          child: Text(
                        video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w600, fontSize: 15),
                      )),
                      Flexible(
                          child: Text(
                        "${video.author.username} * ${video.viewCount}* ${timeago.format(video.timestamp)}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
                      ))
                    ]),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert_outlined, size: 20),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
