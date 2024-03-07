import 'package:flutter/material.dart';
import 'package:swasthmind_reels/reel.dart';

class ReelsVideoLists extends StatelessWidget {
  const ReelsVideoLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ReelsVideo(
      videoUrls: [
        'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
        'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
        'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
        'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
        'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
        'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
        'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ],
    );
  }
}
