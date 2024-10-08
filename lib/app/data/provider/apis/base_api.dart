import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart' as dio;
import '../../model/network_models/api_response.dart';


mixin BaseApiClass {
  onRequest(
      {required dio.Dio client,
      required Method method,
      data,
      required url,
      ApiResponse Function(dynamic)? successResponse,bool tokenValidation =true}) async {
    printURiHeaders(url, client, method, data);
    try {
      var response;
      if (method == Method.get) {
        response = await client.getUri(url);
      } else if (method == Method.post) {
        response = await client.postUri(url, data: data);
      } else if (method == Method.put) {
        response = await client.putUri(url, data: data);
      } else if (method == Method.delete) {
        response = await client.deleteUri(url);
      } else if (method == Method.patch) {
        response = await client.patchUri(url, data: data);
      }
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (successResponse != null) {
          return successResponse(response);
        } else {
          return ApiResponse(
              apiStatus: ApiStatus.success,
              data: response.data["data"],
              message: response.data['message'] ?? "");
        }
      } else {
        return ApiResponse(apiStatus: ApiStatus.error, message: "");
      }
    } on dio.DioError catch (e) {
      return await onDioErrorFunc(e,tokenValidation);
    }
  }

  onDioErrorFunc(e,tokenValidation) async {
    printDioError(e);
    if (e.response?.statusCode == 500 || e.response == null) {
      return ApiResponse(
          apiStatus: ApiStatus.error,
          message: "😞 Sorry, Please try again later..(500)");
    }
    if (e.response?.statusCode == 401 && tokenValidation) {
      return ApiResponse(
          apiStatus: ApiStatus.error, message: "Invalid Token (401)");

    }
    if (e.response?.statusCode == 422) {
      return ApiResponse(
          apiStatus: ApiStatus.error, message: "Invalid Request (422)");
      // Get.find<AuthService>().removeCurrentUser(false);
    }
    // if (e.response?.statusCode == 404) {
    //   return ApiResponse(
    //       apiStatus: ApiStatus.error,
    //       message: "🔦 Sorry, Not Found What you are looking for..(404)");
    // }

    if (e.response!.data != null && e.response!.data.toString()[0] != "<") {
      var data;
      var message;
      var status;
      try {
        data = e.response?.data?["data"];
        message = e.response?.data["message"];
        status = e.response?.statusCode;
      } catch (e) {}
      return ApiResponse(
          apiStatus: status == 401 ? ApiStatus.unAuthorize : ApiStatus.error,
          data: data,
          message: message.toString());
    } else {
      return ApiResponse(apiStatus: ApiStatus.unknownError, message: "");
    }
  }

  printDioError(e) {
    if (kDebugMode) {
      // print(e);
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    }
  }

  printURiHeaders(uri, _http, method, data) {
    if (kDebugMode) {
      print(_http.options.headers);
      print("$method  endPoint: $uri  data:${data.toString()}");
    }
  }
}

enum Method { get, post, put, delete, patch }
