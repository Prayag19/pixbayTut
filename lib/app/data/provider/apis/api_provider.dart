import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../model/network_models/api_response.dart';
import '../../model/network_models/request_model.dart';
import 'base_api.dart';
import 'package:http_parser/http_parser.dart';

class ApiCaller extends GetxService with BaseApiClass {
  late dio.Dio _httpClient;

  ApiCaller() {
    _httpClient = dio.Dio();
  }

  Future<ApiCaller> init() async {
    return this;
  }

  initialised() {}



  getRequestData(BaseRequest data) async {
    return await onRequest(
        url: data.getRequestUrl(),
        client: data.httpClient ?? _httpClient,
        method: Method.get,
        successResponse: (response) {
          return ApiResponse(
              apiStatus: ApiStatus.success, data: response.data, message: "");
        });
  }




}
