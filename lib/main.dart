import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:swasthmind_reels/screens/content_screen.dart';
import 'package:swasthmind_reels/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'package:card_swiper/card_swiper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swasthmind Reels',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ApiScreens(),
    );
  }
}

const API =
    'https://v1.nocodeapi.com/swasthmind/vimeo/lXdLqWzHUkEKpStR/videos?user_id=user216143604';

class ApiScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vimeo Video Data'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: apicall(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final responseData = snapshot.data!;
            return Swiper(
              itemBuilder: (BuildContext context, int index) {
                final data = responseData['data'][index];
                return Stack(
                  children: [
                    const ContentScreen(
                      // src: videos[index],
                      // src: data['player_embed_url'],
                      // src: 'https://vimeo.com/918060937',
                      src:
                          'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
                    ),
                    ListTile(
                      tileColor: Colors.lightBlueAccent,
                      title: Text(data['name']),
                      subtitle: Text(data['player_embed_url'] ?? ''),
                      leading: Image.network(
                          data['pictures']['sizes'][0]['link'] ?? ''),
                    ),
                  ],
                );
              },
              itemCount: responseData['data'].length,
              scrollDirection: Axis.vertical,
            );
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> apicall() async {
    const String apiUrl = API;
    http.Response response;
    try {
      response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer 305a987d564fc989357b9cd11bcf758d',
        },
      );
      log(response.body);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData;
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Error making HTTP request: $e';
    }
  }
}
