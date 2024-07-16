import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:shimmer/shimmer.dart';

class NewsCardBuild extends StatelessWidget {
  const NewsCardBuild({
    super.key,
    required this.articalList,
  });

  final List<ArticalModel> articalList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articalList.length,
      itemBuilder: (context, index) =>
          articalList[index].title == "[Removed]" ||
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
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(13),
                    height: 190,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        opacity: .3,
                        colorFilter: const ColorFilter.mode(
                          Color.fromARGB(255, 0, 0, 0),
                          BlendMode.dstATop,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          articalList[index].title!,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "PlayfairDisplay"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              articalList[index].author!.length <= 18
                                  ? "by ${articalList[index].author}"
                                  : "by ${"${articalList[index].author!.substring(0, 18)}..."}",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Nunito"),
                            )
                          ],
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
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(13),
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(13),
                    height: 190,
                    child: const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
    );
  }
}
