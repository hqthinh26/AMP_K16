import "package:flutter/material.dart";
import 'package:video_player/video_player.dart';

class VideoPlayerCustom extends StatefulWidget {
  late final String promoVidUrl;
  VideoPlayerCustom({Key? key, required this.promoVidUrl}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerCustom> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    print("widget video url ${widget.promoVidUrl}");
    this._controller = VideoPlayerController.network(widget.promoVidUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Center(
              child: this._controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: this._controller.value.aspectRatio,
                      child: VideoPlayer(this._controller),
                    )
                  : Container(),
            ),
          ),
          ElevatedButton(
            child: Icon(
              this._controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
            onPressed: () {
              setState(() {
                this._controller.value.isPlaying
                    ? this._controller.pause()
                    : this._controller.play();
              });
            },
          )
        ],
      ),
    );
  }
}
