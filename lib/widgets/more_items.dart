import 'package:flutter/material.dart';
import 'package:instagram/utils/img_paths.dart';

import '../data/more_items.dart';

class MoreItem extends StatelessWidget {
  const MoreItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.grey,
              width: 50,
              height: 3,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(ImagePaths.save),
                    )),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Save',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all()),
                    child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.video_collection_rounded))),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Remix',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all()),
                    child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.qr_code_scanner_rounded))),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'QR code',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: moreItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    moreItems[index]['icon'],
                    color: moreItems[index]['title'] == 'Report'
                        ? Colors.red
                        : Colors.black,
                  ),
                  title: Text(
                    moreItems[index]['title'],
                    style: TextStyle(
                        color: moreItems[index]['title'] == 'Report'
                            ? Colors.red
                            : Colors.black),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
