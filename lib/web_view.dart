import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstagramReelsScreen extends StatefulWidget {
  const InstagramReelsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InstagramReelsScreenState createState() => _InstagramReelsScreenState();
}

class _InstagramReelsScreenState extends State<InstagramReelsScreen> {
  final WebViewController _controller = WebViewController()
    ..setNavigationDelegate(NavigationDelegate(
      onProgress: (int progress) {},
      onNavigationRequest: (request) {
        if (request.url.startsWith('www.google.com')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ))
    ..loadRequest(
      Uri.parse('https://www.instagram.com/theswasthmind/reels/'),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Reels'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
