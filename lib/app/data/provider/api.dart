

import 'package:dio/dio.dart';

const baseUrl = 'https://sandboxapi.fitbank.com.br/main/execute/';

class ApiClient {
   static Dio dio=Dio(BaseOptions(
    baseUrl: baseUrl,
    sendTimeout: 5000, //5s
    receiveTimeout: 5000,
    followRedirects: false,
    validateStatus: (status) { return status! < 500; }
  ));


  setBaseToken(token){
    print("token $token");
    dio.options.headers.putIfAbsent("Authorization", () => "Basic $token");
    print("tokenAdd: ${dio.options.headers.toString()}");
  }

  removeBaseToken(){
    dio.options.headers.remove("Authorization");
  }

  Future<Response?> get(String url,{
    dynamic param,
  }) async {
    try {
      print("token ${dio.options.headers.toString()}");
      Response response = await dio.get(url,queryParameters: param);
      return response;
    } on DioError catch (e) {
      print("error DIO");
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        if(e.response!.statusCode==500 || e.response!.statusCode==404){
          print(e.response!.data);
          print(e.response!.headers);
          print(e.response!.requestOptions);
          return Response(statusCode: e.response!.statusCode,
            statusMessage: "Interval Server Error",
            requestOptions: e.response!.requestOptions,
            data: null
          );
        }
        /*return Response(statusCode:e.response!.statusCode ,statusMessage: e.response!.data['message']??'Problem',
            requestOptions: e.response!.requestOptions,data: e.response!.data);*/
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        return Response(statusCode:e.response!.statusCode ,statusMessage: e.message,
            requestOptions: e.requestOptions);
      }
    }
  }
    Future<Response?> post(String url,{
      required Map<String, dynamic> jsonData,
      dynamic param,
    }) async {
      try {
        Response response = await dio.post(url,data: jsonData,queryParameters: param);
        return response;
      }on DioError catch (e) {
        print("error DIO");
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        if (e.response != null) {
          print("if");
          print(e.response!.data['message']);

          //print(e.response!.headers);
         //print(e.response!.requestOptions);

          return Response(statusCode:e.response!.statusCode ,statusMessage: e.response!.data['message'],
              requestOptions: e.response!.requestOptions,data: e.response!.data);
        } else {
          print("else");
          // Something happened in setting up or sending the request that triggered an Error
          print(e.toString());
          //print(e.message);
          return Response(statusCode:e.response!.statusCode ,statusMessage: e.message,
              requestOptions: e.requestOptions);
        }
      }
    }

    Future<Response?> patch(String url,{
      required Map<String, dynamic> jsonData,
      dynamic param,
    }) async {
      try {
        Response response = await dio.patch(url,data: jsonData,queryParameters: param);
        return response;
      } on DioError catch (e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        if (e.response != null) {
          print(e.response!.data);
          print(e.response!.headers);
          print(e.response!.requestOptions);
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          print(e.requestOptions);
          print(e.message);
        }
      }
    }

    Future<Response?> put(String url,{
      required Map<String, dynamic> jsonData,
      dynamic param,
    }) async {
      try {
        Response response = await dio.put(url,data: jsonData,queryParameters: param);
        return response;
      } on DioError catch (e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        if (e.response != null) {
          print(e.response!.data);
          print(e.response!.headers);
          print(e.response!.requestOptions);
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          print(e.requestOptions);
          print(e.message);
        }
      }
    }

    Future<Response?> delete(String url,{
      required Map<String, dynamic> jsonData,
      dynamic param,
    }) async {
      try {
        Response response = await dio.delete(url,data: jsonData,queryParameters: param);
        return response;
      } on DioError catch (e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        if (e.response != null) {
          print(e.response!.data);
          print(e.response!.headers);
          print(e.response!.requestOptions);
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          print(e.requestOptions);
          print(e.message);
        }
      }
    }

}