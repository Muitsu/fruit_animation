import 'package:flutter/material.dart';
import 'package:flutter_fruits_animation/utils/colors.dart';
import 'package:flutter_fruits_animation/utils/helpers.dart';
import 'package:flutter_fruits_animation/utils/sizing.dart';
import 'package:flutter_svg/svg.dart';

class Link {
  final String url;
  final String icon;
  final String title;

  Link(this.icon, this.url, this.title);
}

List<Link> links = [
  Link("github", "https://github.com/yunweneric/", "Github"),
  Link("x", "https://twitter.com/yunweneric", "X"),
  Link("linkedIn", "https://www.linkedin.com/in/yunwen-eric-40517a147/",
      "LinkedIn"),
];

class Follow extends StatelessWidget {
  final int activeIndex;
  final Duration duration;

  const Follow({super.key, required this.activeIndex, required this.duration});

  linkItem(Link link, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AnimatedContainer(
        curve: Curves.elasticOut,
        duration: duration,
        color: activeIndex == 0
            ? AppColors.strawberry
            : activeIndex == 1
                ? AppColors.orange
                : AppColors.apple,
        child: TextButton.icon(
          style: TextButton.styleFrom(
            fixedSize: Size(Sizing.width(context) / 12, 30),
            alignment: Alignment.centerLeft,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          onPressed: () {
            Helpers.navigate(link.url);
          },
          label: Text(
            link.title,
            style: const TextStyle(color: AppColors.white),
          ),
          icon: SvgPicture.asset("assets/icons/${link.icon}.svg",
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.color,
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: Sizing.width(context) / 10,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Center(
                child: Text("Follow For More", style: TextStyle(fontSize: 12))),
          ),
          const SizedBox(height: 5),
          Container(
            width: Sizing.width(context) / 10,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...links.map((link) {
                  return linkItem(link, context);
                })
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: Sizing.width(context) / 10,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Center(
                child: Text("Coded by Yunwen", style: TextStyle(fontSize: 12))),
          ),
        ],
      ),
    );
  }
}
