import 'package:dio/dio.dart';
import 'package:news_app/models/artical_model.dart';

class GetAllNewsService {
  Dio dio = Dio();
  static const String baseUrl =
      "https://newsapi.org/v2/top-headlines?country=us";
  static const String apiKeyValue = "a635aff4c8e345ca997336a282d2d25b";
  static const String apiKeyValue2 = "c9d7c5ca57ce49578e0ac9e36fd2e9fd";
  Future<dynamic> request(String category) async {
    try {
      Response response =
          await dio.get("$baseUrl&category=$category&apiKey=$apiKeyValue2");
      if (response.statusCode == 200) {
        List<dynamic> articles = response.data['articles'];
        List<ArticalModel> articalList = [];
        for (var artical in articles) {
          ArticalModel articalModel = ArticalModel(
            content: artical["content"],
            author: artical["author"],
            title: artical['title'],
            description: artical["description"],
            url: artical["url"],
            urlToImage: artical["urlToImage"],
            publishedAt: artical["publishedAt"],
          );
          articalList.add(articalModel);
        }
        return articalList;
      }
    } on Exception catch (error) {
      print("=================== $error ==================");
    }
  }
}
