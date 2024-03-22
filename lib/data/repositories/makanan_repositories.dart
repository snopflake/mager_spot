import 'package:dio/dio.dart';
import 'package:mager_spot/data/datasources/local/local_storage.dart';
import 'package:mager_spot/data/datasources/remote/api.dart';
import 'package:mager_spot/data/models/makanan_model.dart';

class MakananRepositories {
  final Dio _dio = Dio();

  // Mendapatkan token dari local storage
  Future<String?> _init() async {
    String? token = await UserLocalStorage.getUserToken();
    return token;
  }

  // Mendapatkan semua post dari API
  Future<List<MakananModel>> getAllFoods() async {
    List<MakananModel> data = [];
    String? userToken = await _init();
    try {
      final response = await _dio.get(
        Api.getFoodPostEndpoint(),
        options: Options(headers: {'Authorization': 'Bearer $userToken'}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> foodPosts = response.data['foodPosts'];
        if (foodPosts.isNotEmpty) {
          for (var item in foodPosts) {
            MakananModel dataJson = MakananModel.fromJson(item);
            data.add(dataJson);
          }
        }
      }
    } catch (e) {
      throw Exception("Error at getAllFoods ${e.toString()}");
    }
    return data;
  }
}
