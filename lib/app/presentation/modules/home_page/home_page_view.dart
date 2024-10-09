import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pixbaydemo/app/domain/dto/picture_page_dto.dart';
import 'package:pixbaydemo/app/presentation/base/base_api_response_view.dart';
import 'package:pixbaydemo/app/presentation/base/base_lazy_load_view.dart';
import '../../../domain/dto/picture_dto.dart';
import '../../../ui/constant/strings.dart';
import '../../../ui/widgets/picture_container.dart';
import '../../base/base_view.dart';
import 'home_page_controller.dart';

class HomeViewPageView extends GetView<HomeViewPageController> {
  const HomeViewPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(onViewCreated: (context, orient, cons) {
      return Obx(() {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: TextFormField(
                          onChanged: (s) {
                            controller.query.value = s;
                            controller.getPictures(true);
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              fillColor: Colors.black12,
                              filled: true,
                              hintText: Strings.instance.textSearch,
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ApiResponseViewObserver(
                  onSuccessData: (PicturePagesDTo picturePageDto) {
                    return Obx(() {
                      return BaseLazyLoadView(
                        buildList: picturePageDto.pictureDto,
                        scrollController: controller.scrollerController.value,
                        totalPages: picturePageDto.totalPages,
                        currentPage: picturePageDto.currentPage,
                        buildIndexItem: (PictureDto picture) {
                          return PictureContainer(picture: picture,).animate().slideY(begin: -0.05, end: 0);
                        },
                        isLoading: controller.isLoading.value,
                        itemWidth: 200,
                        itemHeight: 200,
                      );
                    });
                  },
                  apiResponse: controller.apiResponse.value,
                ))
              ],
            ),
          ),
        );
      });
      ;
    });
  }
}


