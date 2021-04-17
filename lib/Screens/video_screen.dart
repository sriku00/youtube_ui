import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_ui/Screens/nave_screen.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(shrinkWrap: true, slivers: [
            SliverToBoxAdapter(child: Consumer(
              builder: (BuildContext context, watch, _) {
                final selectedImage = watch(selectedvideoProvider).state;
                return Column(
                  children: [
                    Stack(children: [
                      Image.network(selectedImage!.thumbnailUrl,
                          height: 220, width: double.infinity, fit: BoxFit.cover),
                      IconButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                            size: 40,
                          ),
                          onPressed: () {
                            context
                                .read(miniPlayerControllerProvider)
                                .state
                                .animateToHeight(state: PanelState.MIN);
                          })
                    ]),
                    LinearProgressIndicator(
                        value: 0.4, valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
                  ],
                );
              },
            ))
          ])),
    ));
  }
}
