import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shop_it/api/auth/models/login_model.dart';
import 'package:shop_it/api/user/models/user_model.dart';
import 'package:shop_it/app/config/dio_settings.dart';
import 'package:shop_it/app/config/exceptions.dart';
import 'package:shop_it/app/constants/path_const.dart';

class AuthApi {
  final Dio _dio;
  final String _baseUrl = DioSettings.baseUrl;
  final String _loginPath = Path.login;
  final String _regPath = Path.users;

  AuthApi({
    Dio? dio,
  }) : _dio = dio ?? DioSettings.createDio();

  Future<Map<String, dynamic>> authorize({required Login login}) async {
    try {
      Response response = await _dio.post('$_baseUrl$_loginPath', queryParameters: login.toJson());

      Map<String, dynamic> authData = _parseLoginResponse(response, _loginPath);
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

  Future<Map<String, dynamic>> register({required Login login}) async {
    try {
      Response response = await _dio.put('$_baseUrl$_regPath', data: {'data': login.toJson()});

      Map<String, dynamic> authData = _parseLoginResponse(response, _loginPath);
      return authData;
    } on ParseException {
      rethrow;
    } on ServerException {
      rethrow;
    } on ConnectionException {
      rethrow;
    } catch (e) {
      throw DioExceptions.fromDioError(e as DioError).message;
    }
  }

  Map<String, dynamic> _parseLoginResponse(Response response, String path) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        User? data;
        String? jwtToken;
        if (response.data != null && response.data.isNotEmpty) {
          try {
            jwtToken = response.data['token'];
            // Получаем токен, расшифровываем и конвертируем данные в User
            if (jwtToken != null) {
              Map<String, dynamic> payload = Jwt.parseJwt(jwtToken);
              if (payload.isNotEmpty) {
                data = User.fromJson(payload['dataStoredInToken']);
              } else {
                // не удалось распарсить jwt-токен
                throw ParseException();
              }
            } else {
              throw DioExceptions.fromDioError(DioError(requestOptions: RequestOptions(path: path)));
            }
          } catch (e) {
            throw ParseException();
          }
        }
        return {'token': jwtToken, 'user': data};
      case 400:
      case 401:
      case 404:
        throw ServerException(message: response.data['message']);
      default:
        throw ConnectionException();
    }
  }
}
