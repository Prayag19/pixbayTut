import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../flavor/flavor_config.dart';
import '../../data/model/network_models/api_response.dart';
import '../../data/repository/picture_repository.dart';
import '../../ui/constant/strings.dart';
import '../mappers/picture_dto_mapper.dart';


class  PictureInterActor {
  late PictureRepository _pictureRepository;

  PictureInterActor() {
    _pictureRepository =PictureRepository();
  }

  Future<ApiResponse> getPictures({required String query,required int page, required int perPage}) async {
  ApiResponse apiResponse =  await _pictureRepository.getPictures({
    "q":query},page,perPage);
    if (apiResponse.isSuccess) {
      try {
        apiResponse.data = PictureDtoMappers().getPicturePages(apiResponse.data,page,perPage);
      } catch (e) {
        apiResponse = ApiResponse(
            apiStatus: ApiStatus.error,
            message: Strings.instance.errorUnknownErrorMsg);
      }
    }
    return apiResponse;
  }
}
