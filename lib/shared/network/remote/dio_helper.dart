import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qastly/shared/network/local/cache_helper.dart';

class DioHelper{
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://qasatli.ps/api/',
        receiveDataWhenStatusError: true
      ),
    );
  }

  static Future<Response> getData({
    @required String? url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-Client-Device-Name': 'flutter',
      'X-Client-Language': lang,
      'Authorization': 'Bearer $token',
    };
    return await dio!.get(
      url!,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String? url,
    @required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    // String? token,
  }) async {
    String token =  CacheHelper().token;
    dio!.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-Client-Device-Name': 'flutter',
      'X-Client-Language': lang,
      'Authorization': 'Bearer $token',
    };
    return dio!.post(
      url!,
      queryParameters: query ?? null,
      data: data,
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
      )
    );
  }



  static Future<Response> putData({
    @required String? url,
    @required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-Client-Device-Name': 'flutter',
      'X-Client-Language': lang,
      'Authorization': 'Bearer $token',
    };
    return dio!.put(
      url!,
      queryParameters: query ?? null,
      data: data,
    );
  }
}