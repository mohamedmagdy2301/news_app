import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/widget/all_news/Shimmer/shimmer_placeholder_news.dart';
import 'package:news_app/widget/all_news/news_card_build.dart';

class NewsAllCard extends StatelessWidget {
  const NewsAllCard({
    super.key,
    required this.snapshot,
  });

  final snapshot;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.length,
      itemBuilder: (context, index) => snapshot[index].title == "[Removed]" ||
              snapshot[index].urlToImage == "[Removed]" ||
              snapshot[index].description == "[Removed]" ||
              snapshot[index].url == "https://removed.com" ||
              snapshot[index].description == null ||
              snapshot[index].url == null ||
              snapshot[index].title == null ||
              snapshot[index].description == null ||
              snapshot[index].author == null
          ? Container()
          : NewsCardBuild(snapshot: snapshot[index]),
    );
  }
}
