import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:swasthmind_reels/screens/like_icon.dart';
import 'package:swasthmind_reels/screens/options_screen.dart';
import 'package:video_player/video_player.dart';

class ContentScreen extends StatefulWidget {
  final String? src;

  const ContentScreen({super.key, this.src});

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;
  @override
  void initState() {
    _liked = false;
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.src!));
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: _chewieController != null &&
                  _chewieController!.videoPlayerController.value.isInitialized
              ? const Color.fromARGB(255, 233, 245, 255)
              : Colors.white, // Else, set color to red
        ),
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    _liked = !_liked;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Chewie(
                    controller: _chewieController!,
                  ),
                ),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),
        if (_liked)
          const Center(
            child: LikeIcon(),
          ),
        const OptionsScreen()
      ],
    );
  }
}
