import 'package:flutter/material.dart';
import 'package:news_app/widget/all_news/news_list.dart';
import 'package:news_app/widget/all_news/tab_bar_build.dart';
import 'package:news_app/widget/lastest_news/horizontal_list_recent_news.dart';
import 'package:news_app/widget/search/search_news_build.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const SearchNewsBuild(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      HorizontalListRecentNews(),
                      TabBarBuild(),
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(
              children: [
                NewsListViewBuild(requestType: "business"),
                NewsListViewBuild(requestType: "entertainment"),
                NewsListViewBuild(requestType: "health"),
                NewsListViewBuild(requestType: "science"),
                NewsListViewBuild(requestType: "sports"),
                NewsListViewBuild(requestType: "technology"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
