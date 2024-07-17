import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListRecentNewsCard extends StatelessWidget {
  const ShimmerListRecentNewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 175, 175, 175),
      highlightColor: Colors.white,
      enabled: true,
      period: const Duration(seconds: 2),
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
          padding: const EdgeInsets.all(13),
          width: 290,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
