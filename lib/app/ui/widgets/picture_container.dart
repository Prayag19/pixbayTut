import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/dto/picture_page_dto.dart';
import '../constant/colors.dart';

class PictureContainer extends StatelessWidget {
  final PictureDto picture;
  const PictureContainer({
    super.key,
    required this.picture
  });

  @override
  Widget build(BuildContext context) {
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
                        begin: Alignment.bottomCenter)),
              )),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    "${picture.likes} Like",
                    textAlign: TextAlign.start,
                    style:
                    TextStyle(color: AppColor.white),
                  ),
                  Text(
                    "${picture.view} Views",
                    textAlign: TextAlign.start,
                    style:
                    TextStyle(color: AppColor.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}