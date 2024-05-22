import 'package:flutter/material.dart';
import 'package:instagram/utils/img_paths.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(ImagePaths.profile),
              ),
              SizedBox(width: 8),
              Text('puthiyathalaimurai',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.more_vert, color: Colors.black),
            ],
          ),
        ),
        Image.asset('assets/images/dogs.png'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(ImagePaths.like),
                  const SizedBox(
                    width: 7,
                  ),
                  Image.asset(ImagePaths.comment),
                  const SizedBox(
                    width: 7,
                  ),
                  Image.asset(ImagePaths.share),
                ],
              ),
              Image.asset(ImagePaths.save),
            ],
          ),
        ),
        bottomWidget(),
      ],
    );
  }

  bottomWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '3,264 likes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 8.0),
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'knowledgedays ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      'He Got Bail After Writing 300 Words Essay On Road Accident ... ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'more',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'View all 75 comments',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8.0),
          const TextField(
              decoration: InputDecoration(
            hintText: 'Add a comment...',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5),
            ),
          )),
        ],
      ),
    );
  }
}
