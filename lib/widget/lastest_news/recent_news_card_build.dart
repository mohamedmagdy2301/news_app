import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/widget/lastest_news/shimmer/shimmer_placeholder_recent_news.dart';

class RecentNewsCard extends StatelessWidget {
  const RecentNewsCard({
    super.key,
    required this.snapshot,
  });

  final snapshot;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${snapshot.urlToImage}",
      imageBuilder: (context, imageProvider) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        padding: const EdgeInsets.all(13),
        width: 290,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            opacity: .4,
            colorFilter: const ColorFilter.mode(
              Color.fromARGB(255, 17, 17, 17),
              BlendMode.dstATop,
            ),
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              snapshot.author!.length <= 18
                  ? "by ${snapshot.author}"
                  : "by ${"${snapshot.author!.substring(0, 18)}..."}",
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: "Nunito",
              ),
            ),
            const SizedBox(height: 7),
            Text(
              "${snapshot.title}",
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: "PlayfairDisplay",
              ),
            ),
            const Spacer(),
            Text(
              "${snapshot.description}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      placeholder: (context, url) => const ShimmerPlaceholderRecentNews(),
      errorWidget: (context, url, error) => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
          padding: const EdgeInsets.all(13),
          width: 290,
          height: 300,
          child: const Icon(Icons.error),
        ),
      ),
    );
  }
}
