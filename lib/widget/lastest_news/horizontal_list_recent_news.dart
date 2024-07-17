// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:news_app/screen/details_news.dart';
import 'package:news_app/widget/lastest_news/recent_news_all_card.dart';

class HorizontalListRecentNews extends StatefulWidget {
  const HorizontalListRecentNews({super.key});

  @override
  State<HorizontalListRecentNews> createState() =>
      _HorizontalListRecentNewsState();
}

class _HorizontalListRecentNewsState extends State<HorizontalListRecentNews> {
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
                    builder: (BuildContext context) => const DetailsNews(),
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
        const Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 300,
                child: RecentNewsAllCard(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
