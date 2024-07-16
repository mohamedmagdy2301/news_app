import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';

class RecentNewsCard extends StatelessWidget {
  const RecentNewsCard({
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
        ? Container()
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            padding: const EdgeInsets.all(13),
            width: 290,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("${articalList[index].urlToImage}"),
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
                  "by ${articalList[index].author}",
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
                    fontSize: 18,
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
          );
  }
}
