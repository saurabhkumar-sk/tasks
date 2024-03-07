import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:swasthmind_reels/screens/content_screen.dart';

const API =
    'https://v1.nocodeapi.com/swasthmind/vimeo/lXdLqWzHUkEKpStR/videos?user_id=user216143604';

class ApiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: responseData['data'].length,
                itemBuilder: (context, index) {
                  final data = responseData['data'][index];
                  return ContentScreen(
                    src: data['player_embed_url'],
                    // videoName: data['name'],
                    // videoImage: data['pictures']['si
                    // zes'][0]['link'],
                  );
                },
              );
            }
          },
        ),
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
