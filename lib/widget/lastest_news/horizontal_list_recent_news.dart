import 'package:flutter/material.dart';
import 'package:news_app/api/get_news_service_api.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/screen/details_news.dart';
import 'package:news_app/widget/lastest_news/recent_news_card.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalListRecentNews extends StatefulWidget {
  const HorizontalListRecentNews({super.key});

  @override
  State<HorizontalListRecentNews> createState() =>
      _HorizontalListRecentNewsState();
}

class _HorizontalListRecentNewsState extends State<HorizontalListRecentNews> {
  List<ArticalModel> articalList = [];
  @override
  void initState() {
    super.initState();
    getArticalListAllNews();
    for (int i = 0; i < articalList.length; i++) {
      loadImage(articalList[i].urlToImage!);
    }
  }

  Future<void> loadImage(String imageUrl) async {
    try {
      await precacheImage(NetworkImage(imageUrl), context);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getArticalListAllNews() async {
    // Future.delayed(const Duration(seconds: 2), () async {
    articalList = await GetAllNewsService().request("general");
    setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Latest News',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "PlayfairDisplay",
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => articalList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : DetailsNews(
                            articalList: articalList,
                          ),
                  ),
                );
              },
              child: const Text(
                'View all',
                style: TextStyle(
                  color: Color.fromRGBO(0, 128, 255, 1),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Nunito",
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 300,
                child: articalList.isEmpty
                    ? Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 175, 175, 175),
                        highlightColor: Colors.white,
                        enabled: true,
                        period: const Duration(seconds: 2),
                        child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 13),
                            padding: const EdgeInsets.all(13),
                            width: 290,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      )
                    : RecentNewsCard(articalList: articalList),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
