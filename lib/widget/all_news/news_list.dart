import 'package:flutter/material.dart';
import 'package:news_app/api/get_news_service_api.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/widget/all_news/news_card_build.dart';
import 'package:shimmer/shimmer.dart';

class NewsListViewBuild extends StatefulWidget {
  const NewsListViewBuild({super.key, required this.requestType});
  final dynamic requestType;

  @override
  State<NewsListViewBuild> createState() => _NewsListViewBuildState();
}

class _NewsListViewBuildState extends State<NewsListViewBuild> {
  List<ArticalModel> articalList = [];
  @override
  void initState() {
    super.initState();

    getArticalListAllNews();
  }

  Future<void> getArticalListAllNews() async {
    articalList = await GetAllNewsService().request(widget.requestType);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return articalList.isEmpty
        ? Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 175, 175, 175),
            highlightColor: Colors.white,
            enabled: true,
            direction: ShimmerDirection.ltr,
            period: const Duration(seconds: 2),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(13),
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          )
        : NewsCardBuild(articalList: articalList);
  }
}
