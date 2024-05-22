import 'package:flutter/material.dart';
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
              const CircleAvatar(
                backgroundImage: AssetImage(ImagePaths.profile),
              ),
              const SizedBox(width: 8),
              const Text('puthiyathalaimurai',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
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
          'assets/images/dogs.png',
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
                    // child:
                    //     Icon(isLiked ? Icons.favorite : Icons.favorite_border),
                    child: Image.asset(
                        isLiked ? ImagePaths.like : ImagePaths.unlike),
                  ),
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
          Text(
            formattedLikeCount,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 3.0),
          const ReadMoreText(
            'He Got Bail AftBail After Writing 300 Words Essay On Road Accident He Got Bail After Writing 300 Words Essay On Road Accident He Got Bail After Writing 300 Words Essay On Road Accident He Got Bail After Writing 300 Words Essay On Road Accident',
            style: TextStyle(
                fontSize: 12,
                fontFamily: "Quicksand",
                // color: AppColors.black,
                fontWeight: FontWeight.w500),
            trimMode: TrimMode.Line,
            trimLines: 1,
            colorClickableText: Colors.red,
            trimCollapsedText: ' view more',
            trimExpandedText: ' view less',
            lessStyle: TextStyle(
              fontSize: 12,
              fontFamily: "Quicksand",
              fontWeight: FontWeight.w700,
              // color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              // decorationColor: AppColors.primaryColor,
            ),
            moreStyle: TextStyle(
              fontSize: 12,
              fontFamily: "Quicksand",
              fontWeight: FontWeight.w700,
              // color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              // decorationColor: AppColors.primaryColor,
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
