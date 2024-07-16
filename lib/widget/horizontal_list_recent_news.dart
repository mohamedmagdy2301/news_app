import 'package:flutter/material.dart';
import 'package:news_app/api/get_news_service_api.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/screen/details_news.dart';
import 'package:news_app/widget/recent_news_card.dart';

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
  }

  Future<void> getArticalListAllNews() async {
    articalList = await GetAllNewsService().request("general");
    setState(() {});
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
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => RecentNewsCard(
                          articalList: articalList,
                          index: index,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
