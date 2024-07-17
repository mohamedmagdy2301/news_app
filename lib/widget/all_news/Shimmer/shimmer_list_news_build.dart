import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListNewsBuild extends StatelessWidget {
  const ShimmerListNewsBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
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
    );
  }
}
