import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final String img;
  final String username;
  final bool isNew;

  const StoryWidget(
      {super.key,
      required this.img,
      required this.username,
      this.isNew = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 74,
          height: 74,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
                color: isNew
                    ? Colors.red
                    : const Color.fromARGB(255, 201, 198, 198),
                width: 3),
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
        const SizedBox(height: 5),
        Text(
          username,
          style: const TextStyle(fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
