import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 110),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        child: Icon(Icons.person, size: 18),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Swasthmind',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.verified,
                        size: 15,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 6),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Flutter is beautiful and fast 💙❤💛 ..',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      const Icon(
                        Icons.music_note,
                        size: 15,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Original Audio - some music track--',
                        style: GoogleFonts.poppins(
                            // color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLike = !isLike;
                      });
                    },
                    child: Icon(
                      isLike ? Icons.favorite : Icons.favorite,
                      color: isLike ? Colors.red : Colors.white,
                    ),
                  ),
                  Text(
                    '601k',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Icon(
                    Icons.comment_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    '1123',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Icon(
                    Icons.more_vert,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
