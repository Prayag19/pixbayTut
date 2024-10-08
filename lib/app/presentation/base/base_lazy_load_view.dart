import 'package:flutter/material.dart';
import 'package:pixbaydemo/app/ui/constant/colors.dart';
import '../../ui/constant/screen.size.dart';


class BaseLazyLoadView extends StatelessWidget {
  final List buildList;
  final int totalPages;
  final int currentPage;
  final ScrollController scrollController;
  bool isLoading;
  Function buildIndexItem;
  final double itemWidth;
  final double itemHeight;

  BaseLazyLoadView(
      {Key? key,
        required this.buildList,
        required this.scrollController,
        required this.totalPages,
        required this.currentPage,
        required this.buildIndexItem,
        required this.itemWidth,   // Width of each grid item
        required this.itemHeight,
        required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: const EdgeInsets.only(bottom: 50),
      shrinkWrap: true,

      itemCount: buildList.length + 1,
      controller: scrollController,
      itemBuilder: (_, index) {
        if(buildList.isEmpty){
          return Container(
            height: Responsive.heightPer(90),
            child: const Center(
              child: Text("No Records"),
            ),
          );
        }
        else if (index < buildList.length) {
          if (buildList.isNotEmpty) {
            return buildIndexItem(buildList[index]);
          } else {
            return const Center(
              child: Text("No Records"),
            );
          }
        } else {
          if (((currentPage < totalPages-1) || currentPage == totalPages) && isLoading == true) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: Responsive.heightPer(100),
                  height: Responsive.height(30),
                  child: Center(
                      child: Container(
                          width: Responsive.height(25), height: Responsive.height(25), child:  CircularProgressIndicator(color: AppColor.lightBlue,)))),
            );
          } else if ((currentPage ==  totalPages) && isLoading == false) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "End of Results",

                ),
              ),
            );
          } else {
            return Container();
          }
        }
      }, gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: itemWidth, // Maximum width of each item
      crossAxisSpacing: 10.0,        // Space between columns
      mainAxisSpacing: 10.0,         // Space between rows
      childAspectRatio: itemWidth / itemHeight, // Aspect ratio of each item
    ),
    );
  }
}