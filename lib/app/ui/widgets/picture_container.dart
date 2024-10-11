import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pixbaydemo/app/ui/widgets/picture_view.dart';

import '../../domain/dto/picture_page_dto.dart';
import '../constant/colors.dart';
import '../constant/screen.size.dart';

class PictureContainer extends StatelessWidget {
  final PictureDto picture;
  const PictureContainer({
    super.key,
    required this.picture
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        openInFullScreen(context,picture);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: PictureView(picture: picture,)
              ),
            ),
            Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
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
      ),
    );
  }

  void openInFullScreen(context, PictureDto pictureDto) {
    showDialog(context: context, builder: (context){
      return   Dialog(
        backgroundColor: Colors.black87,
        insetPadding: EdgeInsets.zero,
        child: SizedBox(
          height: Responsive.heightPer(100),
          width: Responsive.widthPer(100),
          child:Stack(
            children: [
              Positioned.fill(
                child: InteractiveViewer(
                child: PictureView(picture: picture, showFullSizeImage: true,).animate().scale(duration: const Duration(milliseconds: 250)),
              ),
              ),
              Positioned(
                right: Responsive.widthPer(5),
                  top:Responsive.heightPer(5) ,
                  child: IconButton.filledTonal(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.close)))
            ],
          ) ,
        ),

      );
    });
  }
}


