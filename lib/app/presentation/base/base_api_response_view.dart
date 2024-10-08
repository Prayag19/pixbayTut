import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/model/network_models/api_response.dart';
import '../../ui/constant/colors.dart';
import '../../ui/constant/strings.dart';

class ApiResponseViewObserver<T> extends StatelessWidget {
  ApiResponse apiResponse;
  Widget? onLoadingWidget;
  Function onSuccessData;
  VoidCallback? retryFunction;
  String? onIdleData;
  Widget? onErrorWidget;
  Widget? onNetWorkErrorWidget;
  Widget? onUnKnownErrorWidget;

  ApiResponseViewObserver({
    Key? key,
    required this.apiResponse,
    this.onIdleData,
    this.onErrorWidget,
    this.onLoadingWidget,
    this.retryFunction,
    this.onNetWorkErrorWidget,
    required this.onSuccessData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (apiResponse.apiStatus == ApiStatus.success) {
      return onSuccessData(apiResponse.data);
    }
    if (apiResponse.apiStatus == ApiStatus.loading) {
      if (onLoadingWidget == null) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child:CircularProgressIndicator())
              ),
            ),
          ],
        );
      } else {
        return onLoadingWidget!;
      }
    }
    if (apiResponse.apiStatus == ApiStatus.error) {
      if (onErrorWidget == null) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text(
                apiResponse.message ?? "Error",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )),
              retryFunction!=null?  TextButton(
                  onPressed: () {
                    retryFunction?.call();
                  },
                  child: const Text(
                    "Retry",
                    style: TextStyle(
                      color: AppColor.lightBlue,
                    ),
                  )):SizedBox()
            ],
          ),
        );
      } else {
        return onErrorWidget!;
      }
    }
    if (apiResponse.apiStatus == ApiStatus.networkError) {
      if (onNetWorkErrorWidget == null) {
        return Center(
            child: Text(
          apiResponse.message ?? Strings.instance.errorNetwork,
          textAlign: TextAlign.center,
        ));
      } else {
        return onNetWorkErrorWidget!;
      }
    }
    if (apiResponse.apiStatus == ApiStatus.unknownError) {
      if (onUnKnownErrorWidget == null) {
        return Center(
            child: Text(
          Strings.instance.errorUnknownError,
          textAlign: TextAlign.center,
        ));
      } else {
        return onUnKnownErrorWidget!;
      }
    }
    if (apiResponse.apiStatus == ApiStatus.idle) {
      if (onIdleData == null) {
        return Center(child: Text(""));
      } else {
        return Center(
            child: Text(
          onIdleData!,
          textAlign: TextAlign.center,
        ));
      }
    } else {
      return Container();
    }
  }
}
