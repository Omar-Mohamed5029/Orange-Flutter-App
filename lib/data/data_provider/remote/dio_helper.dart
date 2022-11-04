import 'package:dio/dio.dart';

import '../../../constants/end_points.dart';

class DioHelper{
  static late Dio dio;

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Content-Type': '',
        }
      )
    );
  }
  static Future <Response>  getData({
    required String url,
    // Map<String, dynamic>? queryParameters,
    // ProgressCallback? onReceiveProgress,
    String? token,
  }) async {

    try
    {
      dio.options.headers =
      {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.get(
        url,

        // queryParameters: queryParameters,
        // onReceiveProgress: onReceiveProgress,
      );
      // print(response.data.toString());
      return response;
    }

    catch (e)
    {
      rethrow;
    }
  }

  //This Function that's Used To Post Data to API based on URL(End Points) and Headers.
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {

    try
    {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.post(
        url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      // String g=response.requestOptions.data;
      return response;
    }

    catch (e)
    {
      rethrow;
    }

  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    //bool files = false,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try
    {
      dio.options.headers =
      {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.put(
        url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }

    catch (e)
    {
      rethrow;
    }

  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    required String token,
    bool files = false,
  }) async {
    dio.options.headers =
    {
      'Authorization': 'Bearer $token',
      // 'Authorization': token ,
      'Content-Type': 'application/json',
    };
    return await dio.patch(
      url,
      data: data,
    );
  }

  //This Function that's Used To Delete Data to API based on URL(End Points) and Headers.
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
    //String lang = 'en',
  }) async {
    try
    {
      dio.options.headers =
      {
        'Authorization': 'Bearer $token',
        // 'Authorization': token ,
        //'Content-Type': 'application/json',
      };
      final Response response = await dio.delete(
        url,
        data: data,
      );
      return response;
    }

    catch (e) {
      rethrow;
    }

  }
}
