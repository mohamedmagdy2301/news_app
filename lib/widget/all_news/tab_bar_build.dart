import 'package:flutter/material.dart';

class TabBarBuild extends StatelessWidget {
  const TabBarBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: const EdgeInsets.all(9),
      labelColor: Colors.white,
      unselectedLabelColor: const Color.fromARGB(255, 50, 49, 49),
      labelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      unselectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
      splashBorderRadius: BorderRadius.circular(50),
      indicatorColor: Colors.transparent,
      indicatorWeight: 2,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: const EdgeInsets.all(6),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromARGB(255, 240, 75, 94),
      ),
      isScrollable: true,
      dividerHeight: 0,
      physics: const BouncingScrollPhysics(),
      tabAlignment: TabAlignment.center,
      tabs: const [
        Tab(text: 'Business'),
        Tab(text: 'Entertainment'),
        Tab(text: 'Health'),
        Tab(text: 'Science'),
        Tab(text: 'Sports'),
        Tab(text: 'Technology'),
      ],
    );
  }
}
