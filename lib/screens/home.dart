import 'package:flutter/material.dart';
import 'package:instagram/utils/constants.dart';
import 'package:instagram/utils/img_paths.dart';

import '../widgets/post_widget.dart';
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
        /// I used this CustomScrollView to show the app bar when scrolling up and hide it when scrolling down.
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Instagram',
                    style: TextStyle(
                        fontFamily: 'Billabong',
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined)
                  // DropdownButton<String>(
                  //   icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  //   underline: Container(),
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       // selectedItem = newValue!;
                  //     });
                  //   },
                  //   items: <String>['Option 1', 'Option 2', 'Option 3']
                  //       .map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  //   isDense: true,
                  //   dropdownColor: Colors.white,
                  //   style: const TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 16,
                  //   ),
                  //   iconSize: 20, // Adjust icon size if necessary
                  //   itemHeight: null,
                  //   padding: EdgeInsets.only(left: 0, right: 0),
                  // ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Image.asset(ImagePaths.unlike),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(ImagePaths.msg)
                    ],
                  ),
                ),
              ],
              floating: true,
              snap: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// story section
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: stories.map((story) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: StoryWidget(
                              img: story['img']!,
                              username: story['username']!,
                              isNew: story['isNew']!,
                            ),
                          );
                        }).toList(),
                      )),
                  const Divider(
                    thickness: 0.5,
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const PostWidget();
                },
                childCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
