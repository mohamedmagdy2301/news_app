import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';

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
            // fontWeight: FontWeight.bold,
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
            ? Container()
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(articalList[index].urlToImage!),
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
