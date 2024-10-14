import 'package:flutter/material.dart';
import 'package:news_app/widget/lastest_news/recent_news_card_build.dart';

class RecentNewsListBuild extends StatelessWidget {
  const RecentNewsListBuild({
    super.key,
    required this.snapshot,
  });
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data!.length ~/ 2,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
          snapshot.data![index].title == "[Removed]" ||
                  snapshot.data![index].urlToImage == "[Removed]" ||
                  snapshot.data![index].description == "[Removed]" ||
                  snapshot.data![index].url == "https://removed.com" ||
                  snapshot.data![index].description == null ||
                  snapshot.data![index].url == null ||
                  snapshot.data![index].title == null ||
                  snapshot.data![index].description == null ||
                  snapshot.data![index].author == null
              ? Container()
              : RecentNewsCard(
                  snapshot: snapshot.data![index],
                ),
    );
  }
}
