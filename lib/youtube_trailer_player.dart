import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeScreen extends StatefulWidget {
  final String link;
  const YoutubeScreen({super.key, required this.link});

  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId:
                  YoutubePlayer.convertUrlToId(widget.link) ??
                      "TJAfLE39ZZ8",
              flags: const YoutubePlayerFlags(
                mute: false,
                autoPlay: true,
              ),
            ),
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
            onReady: () {
            },
          ),
          builder: (context, player) {
            return Container(
              color: Colors.black,
              child: Center(child: player),
            );
          },
        ),
        SafeArea(
          child: Align(
            alignment:
                Alignment.topLeft,
            child: IconButton(
              icon: const Icon(CupertinoIcons.back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ],
    );
  }
}