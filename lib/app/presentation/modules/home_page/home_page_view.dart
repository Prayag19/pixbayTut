import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pixbaydemo/app/domain/dto/picture_page_dto.dart';
import 'package:pixbaydemo/app/presentation/base/base_api_response_view.dart';
import 'package:pixbaydemo/app/presentation/base/base_lazy_load_view.dart';
import '../../../domain/dto/picture_dto.dart';
import '../../../ui/constant/colors.dart';
import '../../../ui/constant/screen.size.dart';
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
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.white)


                          ),

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
                            scrollController: controller.scrollerController
                                .value,
                            totalPages: picturePageDto.totalPages,
                            currentPage: picturePageDto.currentPage,
                            buildIndexItem: (PictureDto picture) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey,

                                ),

                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          picture.pictureUrl ?? "",
                                          errorBuilder: (c, o, s) {
                                            return Icon(Icons.image);
                                          },
                                          loadingBuilder: (c, ch, progress) {
                                            if (progress == null) {
                                              return ch; // Image is fully loaded
                                            } else {
                                              return Center(
                                                child: CircularProgressIndicator( // Displays a loading spinner while the image is loading
                                                  color: AppColor.lightNavyBlue,
                                                  value: progress
                                                      .expectedTotalBytes !=
                                                      null
                                                      ? progress
                                                      .cumulativeBytesLoaded /
                                                      (progress
                                                          .expectedTotalBytes ??
                                                          1)
                                                      : null,
                                                ),
                                              );
                                            }
                                          },
                                          fit: BoxFit.cover,

                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Colors.black,
                                                    Colors.black87,
                                                    Colors.black54,
                                                    Colors.transparent
                                                  ],
                                                  end: Alignment.center,
                                                  begin: Alignment.bottomCenter
                                              )
                                          ),
                                        )
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text("${picture.likes} Like",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: AppColor.white),
                                            ),
                                            Text("${picture.view} Views",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: AppColor.white),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ).animate().slideY(begin: -0.05 ,end: 0);
                            },
                            isLoading: controller.isLoading.value,
                            itemWidth: 200,
                            itemHeight: 200,);
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
