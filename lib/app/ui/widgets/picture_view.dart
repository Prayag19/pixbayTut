import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/dto/picture_page_dto.dart';
import '../constant/colors.dart';

class PictureView extends StatefulWidget {
  final PictureDto picture;
  final bool showFullSizeImage;
  const PictureView(
      {super.key, required this.picture, this.showFullSizeImage = false});

  @override
  State<PictureView> createState() => _PictureViewState();
}

class _PictureViewState extends State<PictureView> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: (widget.showFullSizeImage
              ? widget.picture.fullPictureUrl
              : widget.picture.pictureUrl) ??
          "",
      fit: widget.showFullSizeImage ? BoxFit.contain : BoxFit.cover,
      placeholder: (context, url) => const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30, width: 30, child: CircularProgressIndicator()),
        ],
      ),
      errorWidget: (context, url, error) => const Icon(Icons.image),
    );
  }
}
