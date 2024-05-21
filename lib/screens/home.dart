import 'package:flutter/material.dart';
import 'package:instagram/utils/constants.dart';
import 'package:instagram/utils/img_paths.dart';

import '../widgets/story_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> stories = [
    {'img': ImagePaths.like, 'username': Constants.user1, 'isNew': false},
    {'img': ImagePaths.logo, 'username': Constants.user1, 'isNew': false},
    {'img': ImagePaths.profile, 'username': Constants.user1, 'isNew': true},
    {'img': ImagePaths.profile, 'username': Constants.user1, 'isNew': true},
    {'img': ImagePaths.profile, 'username': Constants.user1, 'isNew': true},
    {'img': ImagePaths.profile, 'username': Constants.user1, 'isNew': true},
    {'img': ImagePaths.profile, 'username': Constants.user1, 'isNew': true},
    {'img': ImagePaths.profile, 'username': Constants.user1, 'isNew': true},
    {'img': ImagePaths.profile, 'username': Constants.user1, 'isNew': true},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Instagram'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Image.asset(ImagePaths.like),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(ImagePaths.msg)
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: stories.map((story) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: StoryWidget(
                        img: story['img']!,
                        username: story['username']!,
                        isNew: story['isNew']!,
                      ),
                    );
                  }).toList(),
                ))
          ],
        ),
      ),
    );
  }
}
