import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:pixbaydemo/app/domain/dto/picture_page_dto.dart';
import 'package:pixbaydemo/app/domain/interactor/picture_interactor.dart';

import '../../../data/model/network_models/api_response.dart';
import '../../../ui/constant/screen.size.dart';
import '../../base/base_controller.dart';

class HomeViewPageController extends BaseAppController {
  RxInt currentPage = 0.obs;
  RxInt totalPage = 1.obs;
  RxInt itemPerPage = 10.obs;
  RxString query = "".obs;
  late PictureInterActor _interActor;
  Rx<ScrollController> scrollerController = ScrollController().obs;

  Rx<ApiResponse> apiResponse = ApiResponse(apiStatus: ApiStatus.idle).obs;

  HomeViewPageController() {
    _interActor = PictureInterActor();
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setItemsLoader();
    });

    scrollerController.value.addListener(() {
      if ((scrollerController.value.position.pixels) ==
              scrollerController.value.position.maxScrollExtent &&
          currentPage.value < totalPage.value) {
        currentPage.value = currentPage.value + 1;
        isLoading.value = true;
        scrollerController.value
            .jumpTo(scrollerController.value.position.maxScrollExtent);
        getPictures(false);
      }
    });
  }

  getPictures(loadOn) async {
    List<PictureDto> _pictures =
        loadOn ? [] : apiResponse.value.data.pictureDto ?? [];
    if (loadOn) {
      currentPage.value = 1;
      totalPage.value = 2;
      apiResponse.value.apiStatus = ApiStatus.loading;
      apiResponse.refresh();
    }
    apiResponse.value = await _interActor.getPictures(
        query: query.value,
        page: currentPage.value,
        perPage: itemPerPage.value);

    if (apiResponse.value.isSuccess) {
      if (!loadOn) {
        _pictures.addAll(apiResponse.value.data.pictureDto ?? []);
        apiResponse.value.data.pictureDto = _pictures;
        currentPage.value = (apiResponse.value.data != null)
            ? apiResponse.value.data.currentPage ?? 0
            : 0;
        totalPage.value = (apiResponse.value.data != null)
            ? apiResponse.value.data.totalPages ?? 0
            : 0;
        isLoading.value = false;
      }
    }
  }

  void setItemsLoader() {
    double width = Responsive.widthPer(100);
    if (width > 1000) {
      itemPerPage.value = 50;
    } else if (width > 500) {
      itemPerPage.value = 30;
    } else {
      itemPerPage.value = 20;
    }

    getPictures(true);
  }
}
