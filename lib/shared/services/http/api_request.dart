import 'package:dio/dio.dart';

import 'dart:async';

import 'package:pokedex/helpers/exception.dart';
import 'package:pokedex/shared/models/api_url_method.dart';

class ApiRequest {
  Dio _http = Dio(
    BaseOptions(
      connectTimeout: 50000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
    ),
  );

  Future authRequest(
    ApiUrlMethod api, {
    data,
    query,
    cache: false,
  }) async {
    return await request(
      api,
      // token: Auth.usuario?.token,
      data: api.body ?? data,
      query: query,
    );
  }

  Future request(
    ApiUrlMethod api, {
    String token,
    data,
    query,
    cache: false,
  }) async {
    Options requestOptions = Options(
      method: api.httpMethod,
      contentType: "application/json",
      validateStatus: (int status) {
        return status.toInt() < 400;
      },
    );

    if (token != null) {
      requestOptions.headers = {
        "Authorization": "Bearer $token",
      };
    }

    print('${api.httpMethod} -> ${api.url}');

    try {
      Response response = await this._http.request(
            api.url,
            data: data,
            options: requestOptions,
            queryParameters: query,
          );

      return response.data;
    } catch (error) {
      if (error is DioError) {
        error.error = getMessage(error);

        throw error;
      }
      throw Exception(getMessage(error));
    }
  }
}
