import 'dart:core';

import 'package:dio/dio.dart';
import 'package:sws/network/model/dashboard/dashboard_response.dart';

import '../common_libs.dart';
import 'model/dashboard/dashboard_end_point.dart';
import 'model/dashboard/dashboard_request.dart';

import 'network_result.dart';

Future<void> _injectHeaders(RequestOptions request) async {
  final headers = request.headers;
 // headers['Authorization'] = 'Basic ZmVkb3JhOmZlZG9yYQ==';
  headers["Content-Type"]= "application/x-www-form-urlencoded";
  // if ((ACCESS_TOKEN ?? '').isNotEmpty == true) {
  //   headers['accessToken'] = ACCESS_TOKEN;
  // }
  request.headers = headers;
}

Dio _setupDio() {
  final instance = Dio(BaseOptions(
    connectTimeout: Duration(seconds: 20000),
    baseUrl: "http://54.177.228.124:8000/api/v1/",
  ));
  instance.interceptors
      .add(InterceptorsWrapper(onRequest: (request, handler) async {

    await _injectHeaders(request);
    debugPrint(request.uri.toString());
    debugPrint('headers = ${request.headers}');
    debugPrint('data = ${request.data.toString()}');
    return handler.next(request); //continue
    // If you want to resolve the request with some custom data，
    // you can resolve a `Response` object eg: return `dio.resolve(response)`.
    // If you want to reject the request with a error message,
    // you can reject a `DioError` object eg: return `dio.reject(dioError)`
  }, onResponse: (response, handler) {
    // Do something with response data

    debugPrint(response.requestOptions.uri.toString());


    debugPrint(response.data.toString());
    assert(response.data is Map<String, dynamic>);
    // return response.requestOptions.extra['decoder'](response.data);
    return handler.next(response); // continue
    // If you want to reject the request with a error message,
    // you can reject a `DioError` object eg: return `dio.reject(dioError)`
  }, onError: (DioError e, handler) {
    debugPrint(e.toString());


   //continue
    // If you want to resolve the request with some custom data，
    // you can resolve a `Response` object eg: return `dio.resolve(response)`.
  }));
  // final performanceInterceptor = DioFirebasePerformanceInterceptor();
  // _instance.interceptors.add(performanceInterceptor);
  return instance;
}

class HttpClient {
  final Dio _dio;

  HttpClient._(this._dio);

  HttpClient.env() : this._(_setupDio());


  Future<NetworkResult<DashboardResponse>> dashboardRequest(

  ) async {
    final requestData = DashboardRequest();

    final endpointUseCase = DashboardEndpointUsecase(_dio);

    return endpointUseCase.request(requestData);
  }



}
