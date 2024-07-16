import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:shimmer/shimmer.dart';

class DetailsNews extends StatelessWidget {
  const DetailsNews({
    super.key,
    required this.articalList,
  });
  final List<ArticalModel> articalList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Latest News",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 240, 75, 94),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: articalList.length,
        itemBuilder: (context, index) => articalList[index].title ==
                    "[Removed]" ||
                articalList[index].urlToImage == "[Removed]" ||
                articalList[index].description == "[Removed]" ||
                articalList[index].url == "https://removed.com" ||
                articalList[index].content == null ||
                articalList[index].url == null ||
                articalList[index].title == null ||
                articalList[index].content == null ||
                articalList[index].author == null
            ? Shimmer(
                gradient: const LinearGradient(
                  colors: [Colors.grey, Colors.white],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.5],
                  tileMode: TileMode.clamp,
                ),
                child: Container())
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                        imageUrl: articalList[index].urlToImage!,
                        placeholder: (context, url) => Shimmer.fromColors(
                              baseColor:
                                  const Color.fromARGB(255, 148, 147, 147),
                              highlightColor: Colors.white,
                              enabled: true,
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                ),
                              ),
                            ),
                        imageBuilder: (context, imageProvider) => Container(
                              height: 200,
                              width: double.infinity,
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(14)),
                              ),
                            ),
                        errorWidget: (context, url, error) => Container(
                              height: 200,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.error,
                                ),
                              ),
                            )),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            articalList[index].author!.length <= 18
                                ? "by ${articalList[index].author}"
                                : "by ${"${articalList[index].author!.substring(0, 18)}..."}",
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            articalList[index]
                                .publishedAt!
                                .replaceRange(10, null, " "),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        articalList[index].title!.replaceRange(40, null, " "),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        articalList[index].content!,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 33),
                  ],
                ),
              ),
      ),
    );
  }
}
