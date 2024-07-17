import 'package:flutter/material.dart';
import 'package:news_app/api/get_news_service_api.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/widget/lastest_news/recent_news_list_build.dart';
import 'package:news_app/widget/lastest_news/shimmer/shimmer_list_recent_news.dart';

class RecentNewsAllCard extends StatefulWidget {
  const RecentNewsAllCard({
    super.key,
  });

  @override
  State<RecentNewsAllCard> createState() => _RecentNewsAllCardState();
}

class _RecentNewsAllCardState extends State<RecentNewsAllCard> {
  var future;
  @override
  void initState() {
    super.initState();
    future = GetAllNewsService().request("general");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticalModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return const ShimmerListRecentNewsCard();
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return RecentNewsListBuild(snapshot: snapshot);
          }
        });
  }
}
