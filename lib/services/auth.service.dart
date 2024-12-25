import "dart:developer";
import "package:dio/dio.dart";
import "package:annfsu_app/models/auth/auth.models.dart";
import "package:annfsu_app/models/error.model.dart";
import "package:annfsu_app/utils/constants.dart";

class AuthAPIService {
  final Dio _dio = Dio();

  Future<dynamic> login(String email, String password) async {
    try {
      final String url = ApiConstants.baseUrl + ApiConstants.loginEndpoint;

      final Response response =
          await _dio.post(url, data: {"email": email, "password": password});

      if (response.statusCode == 200) {
        Authentication model = Authentication.fromJson(response.data);
        return model;
      } else {
        Errors errors = Errors.fromJson(response.data);
        return errors;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('Dio error: ${e.response?.data ?? '{}'}');
      } else {
        log('Dio error: ${e.message}');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> register(
      String email,
      String password,
      String fullName,
      String gender,
      String bloodGroup,
      String contactNumber,
      String address,
      String collegeName,
      String position) async {
    try {
      final String url = ApiConstants.baseUrl + ApiConstants.registerEndpoint;

      final Response response = await _dio.post(url, data: {
        "email": email,
        "password": password,
        "full_name": fullName,
        "gender": gender,
        "blood_group": bloodGroup,
        "contact_number": contactNumber,
        "address": address,
        "college_name": collegeName,
        "position": position
      });

      if (response.statusCode == 200) {
        Authentication model = Authentication.fromJson(response.data);
        return model;
      } else {
        Errors errors = Errors.fromJson(response.data);
        return errors;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('Dio error: ${e.response?.data ?? '{}'}');
      } else {
        log('Dio error: ${e.message}');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
