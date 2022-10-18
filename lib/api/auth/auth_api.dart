import 'package:dio/dio.dart';
import 'package:shop_it/api/auth/models/login_model.dart';
import 'package:shop_it/api/user/models/user_model.dart';
import 'package:shop_it/app/config/dio_settings.dart';
import 'package:shop_it/app/config/exceptions.dart';
import 'package:shop_it/app/constants/path_const.dart';

class AuthApi {
  final Dio _dio;
  final String _baseUrl = DioSettings.baseUrl;
  final String _loginPath = Path.login;

  AuthApi({
    Dio? dio,
  }) : _dio = dio ?? DioSettings.createDio();

  Future<User?> authorize({required Login login}) async {
    try {
      Response response = await _dio.post('$_baseUrl$_loginPath', queryParameters: login.toJson());

      User? authData = _parseLoginResponse(response);
      return authData;
    } on ParseException {
      rethrow;
    } on NotFoundException {
      rethrow;
    } on ConnectionException {
      rethrow;
    } catch (e) {
      throw DioExceptions.fromDioError(e as DioError).message;
    }
  }

  User? _parseLoginResponse(Response response) {
    User? data;

    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        if (response.data != null && response.data.isNotEmpty) {
          try {
            data = User.fromJson(response.data);
          } catch (e) {
            throw ParseException();
          }
        }
        return data;
      case 400:
        throw NotFoundException();
      default:
        throw ConnectionException();
    }
  }
}
