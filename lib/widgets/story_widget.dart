import 'package:flutter/material.dart';

import '../utils/img_paths.dart';

class StoryWidget extends StatelessWidget {
  final String img;
  final String username;
  final bool isNew;
  final bool isYourStory;

  const StoryWidget(
      {super.key,
      required this.img,
      required this.username,
      required this.isNew,
      required this.isYourStory});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            width: 78,
            height: 78,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: isYourStory == false
                  ? Border.all(
                      color: isNew
                          ? Colors.red
                          : const Color.fromARGB(255, 201, 198, 198),
                      width: 3,
                    )
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipOval(
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          isYourStory == false
              ? Container()
              : Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(ImagePaths.addIcon),
                )
        ]),
        const SizedBox(height: 5),
        Text(
          username,
          style: const TextStyle(fontSize: 10),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
