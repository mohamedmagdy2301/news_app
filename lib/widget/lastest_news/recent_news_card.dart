import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:shimmer/shimmer.dart';

class RecentNewsCard extends StatelessWidget {
  const RecentNewsCard({
    super.key,
    required this.articalList,
  });
  final List<ArticalModel> articalList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articalList.length ~/ 2,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => articalList[index].title ==
                  "[Removed]" ||
              articalList[index].urlToImage == "[Removed]" ||
              articalList[index].description == "[Removed]" ||
              articalList[index].url == "https://removed.com" ||
              articalList[index].description == null ||
              articalList[index].url == null ||
              articalList[index].title == null ||
              articalList[index].description == null ||
              articalList[index].author == null
          ? Container()
          : CachedNetworkImage(
              imageUrl: "${articalList[index].urlToImage}",
              imageBuilder: (context, imageProvider) => Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                padding: const EdgeInsets.all(13),
                width: 290,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    opacity: .4,
                    colorFilter: const ColorFilter.mode(
                      Color.fromARGB(255, 17, 17, 17),
                      BlendMode.dstATop,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      articalList[index].author!.length <= 18
                          ? "by ${articalList[index].author}"
                          : "by ${"${articalList[index].author!.substring(0, 18)}..."}",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Nunito",
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "${articalList[index].title}",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "PlayfairDisplay",
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${articalList[index].description}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              placeholder: (context, url) => Container(
                alignment: Alignment.center,
                child: Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 175, 175, 175),
                  highlightColor: Colors.white,
                  enabled: true,
                  period: const Duration(seconds: 2),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 13),
                    padding: const EdgeInsets.all(13),
                    width: 290,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ), // you can add pre loader iamge as well to show loading.
              ),
              errorWidget: (context, url, error) => Center(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                  padding: const EdgeInsets.all(13),
                  width: 290,
                  height: 300,
                  child: const Icon(Icons.error),
                ),
              ),
            ),
    );
  }
}
