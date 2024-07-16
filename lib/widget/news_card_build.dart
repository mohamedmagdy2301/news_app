import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';

class NewsCardBuild extends StatelessWidget {
  const NewsCardBuild({
    super.key,
    required this.articalList,
    required this.index,
  });
  final List<ArticalModel> articalList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return articalList[index].title == "[Removed]" ||
            articalList[index].urlToImage == "[Removed]" ||
            articalList[index].description == "[Removed]" ||
            articalList[index].url == "https://removed.com" ||
            articalList[index].description == null ||
            articalList[index].url == null ||
            articalList[index].title == null ||
            articalList[index].description == null ||
            articalList[index].author == null
        ? const Center()
        : Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(13),
            height: 190,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(articalList[index].urlToImage!),
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
                  articalList[index].title ?? "no title",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      fontFamily: "PlayfairDisplay"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    articalList[index].author != null
                        ? Text(
                            articalList[index].author!.length <= 18
                                ? "by ${articalList[index].author}"
                                : "by ${"${articalList[index].author!.substring(0, 18)}..."}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Nunito"),
                          )
                        : const Text(
                            "no author",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Nunito"),
                          ),
                    Text(
                      articalList[index]
                          .publishedAt!
                          .replaceRange(10, null, " "),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Nunito"),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
