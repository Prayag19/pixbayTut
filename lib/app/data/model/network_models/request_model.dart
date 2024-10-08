import '../../../../flavor/flavor_config.dart';
import 'package:dio/dio.dart' as dio;

class BaseRequest {
  dio.Dio? httpClient;
  Map<String, dynamic>? params;
  Map<String, dynamic>? data;
  List<Map<String, dynamic>>? files;
  bool? tokenValidation;
  String url;

  BaseRequest({
    this.params,
    required this.url,
    this.data,
    this.files,
    this.tokenValidation =true,
    this.httpClient,
  });


  Uri getRequestUrl() {
    String baseUrl = FlavorConfig.instance.baseUrl;
    Uri uri = Uri.parse(
      baseUrl+url,
    );
    return params==null?uri:uri.replace(queryParameters: params);
  }
}
