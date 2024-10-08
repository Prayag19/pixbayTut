
import 'package:pixbaydemo/app/data/model/network_models/request_model.dart';
import '../../../../flavor/flavor_config.dart';

class PaginationRequest extends BaseRequest {
  int itemsPerPage;
  int pageNo;

  PaginationRequest(
      {this.itemsPerPage = 10,
      required this.pageNo,
      required super.url,
      required super.params})
      : super();

  Uri getRequestUrl() {
    String baseUrl = FlavorConfig.instance.baseUrl;
    Uri uri = Uri.parse(
      baseUrl + url,
    );
    Map<String, dynamic> query = params ?? {};
    query["key"]=FlavorConfig.instance.getKey();
    query["per_page"] = itemsPerPage.toString();
    query["page"] = pageNo.toString();
    uri = uri.replace(queryParameters: query);

    return uri;
  }
}
