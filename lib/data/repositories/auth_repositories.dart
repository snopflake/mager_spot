import 'package:dio/dio.dart';
import 'package:mager_spot/data/datasources/remote/api.dart';
import '../datasources/local/local_storage.dart';

class AuthRepository {
  final Dio _dio = Dio();

  Future<bool> registerRepository(String username, String email, String password) async {
    try {
      final response = await _dio.post(Api.getRegisterEndpoint(),
          data: {"username": username, "email": email, "password": password});
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      throw Exception("Error at register repository ${e.toString()}");
    }
    return false;
  }

 Future<bool> loginRepository(String username, String password) async {
    try {
      final response = await _dio.post(Api.getLoginEndpoint(),
          data: {"username": username, "password": password});

      if (response.statusCode == 200) {
        final token = response.data["token"];
        await UserLocalStorage.addUserToken(token);
        return true;
      } else {
        throw Exception("Non-200 status code received: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error at login repository ${e.toString()}");
    }
  }

  Future<String?> getUserRepository() async {
    try {
      final userToken = await UserLocalStorage.getUserToken();
      if (userToken != null) {
        return userToken;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Error at get user: ${e.toString()}");
    }
  }


}