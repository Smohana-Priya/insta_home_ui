import 'package:flutter/material.dart';
import 'package:instagram/utils/constants.dart';
import 'package:instagram/utils/img_paths.dart';
import 'package:instagram/widgets/more_items.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  int likeCount = 3264;
  bool isLiked = false;
  String get formattedLikeCount {
    return NumberFormat('#,##0').format(likeCount);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2.5),
                    borderRadius: BorderRadius.circular(30)),
                child: const CircleAvatar(
                  backgroundImage: AssetImage(ImagePaths.dog),
                ),
              ),
              const SizedBox(width: 15),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Constants.dog,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 15,
                      ),
                      Text(
                        Constants.music,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const MoreItem();
                        });
                  },
                  child: const Icon(Icons.more_vert, color: Colors.black)),
            ],
          ),
        ),
        Image.asset(
          ImagePaths.dogPost,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (isLiked) {
                          likeCount--;
                        } else {
                          likeCount++;
                        }
                        isLiked = !isLiked;
                      });
                    },
                    child: Image.asset(
                        isLiked ? ImagePaths.like : ImagePaths.unlike),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(ImagePaths.comment),
                  const SizedBox(
                    width: 10,
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
          Text(
            formattedLikeCount,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 3.0),
          const ReadMoreText(
            Constants.content,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            trimMode: TrimMode.Line,
            trimLines: 1,
            colorClickableText: Colors.red,
            trimCollapsedText: ' view more',
            trimExpandedText: ' view less',
            lessStyle: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 12,
                decorationColor: Colors.black),
            moreStyle: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Colors.black,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            Constants.viewAll,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const TextField(
              decoration: InputDecoration(
            hintText: Constants.addCmnt,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
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
