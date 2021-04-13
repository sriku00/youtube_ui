import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_ui/Models/data.dart';
import 'package:youtube_ui/Screens/home_screen.dart';

final selectedvideoProvider = StateProvider<Video?>((ref) => null);

class NaveScreen extends StatefulWidget {
  @override
  _NaveScreenState createState() => _NaveScreenState();
}

class _NaveScreenState extends State<NaveScreen> {
  static const double _miniHeight = 60.0;
  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    const Scaffold(body: Center(child: Text("Explore"))),
    const Scaffold(body: Center(child: Text("add"))),
    const Scaffold(body: Center(child: Text("subscriptions"))),
    const Scaffold(body: Center(child: Text("library"))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, watch, _) {
          final selectedVideo = watch(selectedvideoProvider).state;

          return Stack(
              children: _screens
                  .asMap()
                  .map((i, screen) => MapEntry(
                      i,
                      Offstage(
                        offstage: _selectedIndex != i,
                        child: screen,
                      )))
                  .values
                  .toList()
                    ..add(
                      Offstage(
                        offstage: selectedVideo == null,
                        child: Miniplayer(
                          minHeight: _miniHeight,
                          maxHeight: MediaQuery.of(context).size.height,
                          builder: (double height, double percentage) {
                            if (selectedVideo == null) return const SizedBox.shrink();

                            return Container(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        selectedVideo.thumbnailUrl,
                                        fit: BoxFit.cover,
                                        height: _miniHeight - 4.0,
                                        width: 120,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Flexible(
                                                    child: Text(
                                                  selectedVideo.title,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 15),
                                                )),
                                                Flexible(
                                                    child: Text(
                                                  "${selectedVideo.author.username} ",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(fontSize: 14),
                                                ))
                                              ]),
                                        ),
                                      ),
                                      IconButton(icon: Icon(Icons.play_arrow), onPressed: () {}),
                                      IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            context.read(selectedvideoProvider).state = null;
                                          })
                                    ],
                                  ),
                                  LinearProgressIndicator(
                                      value: 0.4,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
                                ]));
                          },
                        ),
                      ),
                    ));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore_outlined,
                size: 21,
              ),
              activeIcon: Icon(
                Icons.explore,
                size: 21,
              ),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                size: 30,
              ),
              activeIcon: Icon(Icons.add_circle),
              label: "Add"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.subscriptions_outlined,
                size: 21,
              ),
              activeIcon: Icon(
                Icons.subscriptions,
                size: 21,
              ),
              label: "Subscriptions"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_library_outlined,
                size: 21,
              ),
              activeIcon: Icon(
                Icons.video_library,
                size: 21,
              ),
              label: "Library"),
        ],
      ),
    );
  }
}
