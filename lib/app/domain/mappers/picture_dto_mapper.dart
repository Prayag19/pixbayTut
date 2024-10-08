import 'package:pixbaydemo/app/domain/dto/picture_dto.dart';
import 'package:pixbaydemo/app/domain/dto/picture_page_dto.dart';
import '../../data/model/response_models/get_response_model.dart';

class PictureDtoMappers {
  PicturePagesDTo getPicturePages(
      GetImageListResponse response, currentPage, itemPerPage) {
    int tPages = ((response.totalHits ?? itemPerPage) / itemPerPage).ceil();
    List<PictureDto> pictureList = [];
    if (response.hits != null) {
      pictureList = response.hits!
          .map((e) => PictureDto(
              likes: e.likes?.toString(),
              view: e.views?.toString(),
              pictureUrl: e.previewURL,
              fullPictureUrl: e.largeImageURL))
          .toList();
    }

    PicturePagesDTo pagesDTo = PicturePagesDTo(
        pictureDto: pictureList, totalPages: tPages, currentPage: currentPage);

    return pagesDTo;
  }
}
