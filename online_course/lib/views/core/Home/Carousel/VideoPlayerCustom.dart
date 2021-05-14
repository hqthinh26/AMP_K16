import "package:flutter/material.dart";
import 'package:video_player/video_player.dart';
import "package:chewie/chewie.dart";
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerCustom extends StatefulWidget {
  late final String promoVidUrl;
  VideoPlayerCustom({Key? key, required this.promoVidUrl}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerCustom> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

//   YoutubePlayerController _controller = YoutubePlayerController(
//     initialVideoId: 'iLnmTe5Q2Qw',
//     flags: YoutubePlayerFlags(
//         autoPlay: true,
//         mute: true,
//     ),
// );


  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    print("Promation URL ${widget.promoVidUrl}");
    _videoPlayerController = VideoPlayerController.network(widget.promoVidUrl);
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      autoInitialize: true,
      aspectRatio: 16 / 9,
      // looping: true
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized
          ? 
          Chewie(
              controller: _chewieController!,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Loading'),
              ],
            ),
    );
  }
}
