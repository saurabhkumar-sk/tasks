import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ReelsVideo extends StatelessWidget {
  final List<String> videoUrls;

  const ReelsVideo({super.key, required this.videoUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reels',
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          return VideoItem(videoUrl: videoUrls[index]);
        },
      ),
    );
  }
}

class VideoItem extends StatefulWidget {
  final String videoUrl;

  const VideoItem({super.key, required this.videoUrl});

  @override
  // ignore: library_private_types_in_public_api
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {
        // Video player initialized successfully
      });
    }).catchError((error) {
      log("Video initialization error: $error");
      // Handle the error accordingly, e.g., show an error message to the user.
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _buildVideoPlayer();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildVideoPlayer() {
    return Center(
      child: _controller.value.isInitialized
          ? Chewie(
              controller: ChewieController(
                allowFullScreen: false,
                aspectRatio: _controller.value.aspectRatio,
                videoPlayerController: _controller,
                autoPlay: true,
                looping: true,
                materialProgressColors: ChewieProgressColors(
                  playedColor: Colors.white,
                  backgroundColor: Colors.grey,
                ),
              ),
            )
          : const CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
