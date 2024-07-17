import 'package:flutter/material.dart';
import 'package:news_app/api/get_news_service_api.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/widget/all_news/Shimmer/shimmer_list_news_build.dart';
import 'package:news_app/widget/all_news/news_all_card.dart';

class NewsListViewBuild extends StatefulWidget {
  const NewsListViewBuild({super.key, required this.requestType});
  final dynamic requestType;

  @override
  State<NewsListViewBuild> createState() => _NewsListViewBuildState();
}

class _NewsListViewBuildState extends State<NewsListViewBuild> {
  Future<List<ArticalModel>>? future;
  @override
  void initState() {
    super.initState();

    future = GetAllNewsService().request(widget.requestType);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticalModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return const ShimmerListNewsBuild();
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return NewsAllCard(snapshot: snapshot.data!);
        }
      },
    );
  }
}
