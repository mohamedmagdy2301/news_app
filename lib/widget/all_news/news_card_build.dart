import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widget/all_news/Shimmer/shimmer_placeholder_news.dart';

class NewsCardBuild extends StatelessWidget {
  const NewsCardBuild({
    super.key,
    this.snapshot,
  });
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${snapshot.urlToImage}",
      imageBuilder: (context, imageProvider) => Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(13),
        height: 190,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            opacity: .3,
            colorFilter: const ColorFilter.mode(
              Color.fromARGB(255, 0, 0, 0),
              BlendMode.dstATop,
            ),
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              snapshot.title!,
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: "PlayfairDisplay"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  snapshot.author!.length <= 18
                      ? "by ${snapshot.author}"
                      : "by ${"${snapshot.author!.substring(0, 18)}..."}",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Nunito"),
                )
              ],
            ),
          ],
        ),
      ),
      placeholder: (context, url) => const ShimmerPlaceholderNews(),
      errorWidget: (context, url, error) => Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(13),
        height: 190,
        child: const Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
