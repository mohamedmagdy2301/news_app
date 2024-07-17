import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/get_news_service_api.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:shimmer/shimmer.dart';

class DetailsNews extends StatefulWidget {
  const DetailsNews({
    super.key,
  });

  @override
  State<DetailsNews> createState() => _DetailsNewsState();
}

class _DetailsNewsState extends State<DetailsNews> {
  var future;
  @override
  void initState() {
    super.initState();
    future = GetAllNewsService().request("general");
  }

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
      body: FutureBuilder<List<ArticalModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => snapshot.data![index].title ==
                          "[Removed]" ||
                      snapshot.data![index].urlToImage == "[Removed]" ||
                      snapshot.data![index].description == "[Removed]" ||
                      snapshot.data![index].url == "https://removed.com" ||
                      snapshot.data![index].content == null ||
                      snapshot.data![index].url == null ||
                      snapshot.data![index].title == null ||
                      snapshot.data![index].content == null ||
                      snapshot.data![index].author == null
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
                              imageUrl: snapshot.data![index].urlToImage!,
                              placeholder: (context, url) => Shimmer.fromColors(
                                    baseColor: const Color.fromARGB(
                                        255, 148, 147, 147),
                                    highlightColor: Colors.white,
                                    enabled: true,
                                    child: Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14)),
                                      ),
                                    ),
                                  ),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(14)),
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
                                  snapshot.data![index].author!.length <= 18
                                      ? "by ${snapshot.data![index].author}"
                                      : "by ${"${snapshot.data![index].author!.substring(0, 18)}..."}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  snapshot.data![index].publishedAt!
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
                              snapshot.data![index].title!
                                  .replaceRange(40, null, " "),
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
                              snapshot.data![index].content!,
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
            );
          }
        },
      ),
    );
  }
}
