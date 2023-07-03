import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpClientt {
  String url = 'http://127.0.0.1:8000/api/member/1/';
  final _dio = Dio(BaseOptions(baseUrl: 'http://127.0.0.1:8000/api/member/1/'));

  // HttpClientt(this._dio) {
  //   _dio = Dio(BaseOptions(baseUrl: url));
  // }

  Future getmethod(String baseUrl) async {
    // const clientId = 'de33cf696a9e3914c790';
    // const scope = 'read:user';
    final response = await _dio.get(url);
    print(response);
    interceptors();
  }

  interceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        debugPrint((e.statusMessage));
      },
    ));
  }
}
