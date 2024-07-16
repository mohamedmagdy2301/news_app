import 'package:flutter/material.dart';
import 'package:news_app/api/get_news_service_api.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/widget/news_card_build.dart';

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
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: articalList.length,
            itemBuilder: (context, index) => NewsCardBuild(
              articalList: articalList,
              index: index,
            ),
          );
  }
}
