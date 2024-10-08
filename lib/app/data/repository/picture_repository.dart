import 'package:get/get.dart';
import 'package:pixbaydemo/app/data/model/network_models/pagination_request_model.dart';
import '../../ui/constant/strings.dart';
import '../model/network_models/api_response.dart';
import '../model/response_models/get_response_model.dart';
import '../provider/apis/api.dart';
import '../provider/apis/api_provider.dart';


class PictureRepository {
  late ApiCaller _apiCaller;

  PictureRepository() {
    _apiCaller = Get.find<ApiCaller>();
  }

  Future<ApiResponse> getPictures(params, page, perPage) async {
    PaginationRequest request =
    PaginationRequest(url: AppUrls.getPictures, params: params, pageNo: page,itemsPerPage:perPage );
    ApiResponse apiResponse = await _apiCaller.getRequestData(request);
    if (apiResponse.isSuccess) {
      try {
        apiResponse.data =
            GetImageListResponse.fromJson(apiResponse.data);
      } catch (e) {
        apiResponse = ApiResponse(
            apiStatus: ApiStatus.error,
            message: Strings.instance.errorUnknownErrorMsg);
      }
    }
    return apiResponse;
  }
}
