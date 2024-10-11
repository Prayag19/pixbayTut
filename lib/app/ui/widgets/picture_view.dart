import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/dto/picture_page_dto.dart';
import '../constant/colors.dart';

class PictureView extends StatelessWidget {
  final PictureDto picture;
  final bool showFullSizeImage;
  const PictureView({super.key, required this.picture, this.showFullSizeImage=false});

  @override
  Widget build(BuildContext context) {
    return  Image.network(
      (showFullSizeImage? picture.fullPictureUrl : picture.pictureUrl) ?? "",
      errorBuilder: (c, o, s) {
        return Icon(Icons.image);
      },
      loadingBuilder: (c, ch, progress) {
        if (progress == null) {
          return ch; // Image is fully loaded
        } else {
          return Center(
            child: CircularProgressIndicator(
              // Displays a loading spinner while the image is loading
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
    );
  }
}