import 'package:dio/dio.dart';
import 'package:news_app/models/artical_model.dart';

class GetAllNewsService {
  Dio dio = Dio();
  static const String baseUrl =
      "https://newsapi.org/v2/top-headlines?country=us";
  static const String apiKeyValue = "a635aff4c8e345ca997336a282d2d25b";
  static const String apiKeyValue2 = "c9d7c5ca57ce49578e0ac9e36fd2e9fd";
  Future<List<ArticalModel>> request(String category) async {
    List<ArticalModel> articalList = [];

    try {
      Response response =
          await dio.get("$baseUrl&category=$category&apiKey=$apiKeyValue");
      if (response.statusCode == 200) {
        List<dynamic> articles = response.data['articles'];
        for (var artical in articles) {
          ArticalModel articalModel = ArticalModel.fromJson(artical);
          articalList.add(articalModel);
        }
      }

      return articalList;
    } on Exception catch (error) {
      print("=================== $error ==================");

      return [];
    }
  }
}
