import 'package:flutter/material.dart';

import '../../../flavor/flavor_config.dart';


class BaseView extends StatelessWidget {
  bool showBanner;
  bool canPop;
  Function(bool)? onPop;
  Function(BuildContext context, Orientation orientation,
      BoxConstraints constraints) onViewCreated;
  BaseView({
    super.key,
    this.onPop,
    this.canPop = true,
    this.showBanner = true,
    required this.onViewCreated,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: (s) {
        onPop?.call(s);
      },
      child: Material(
          type: MaterialType.transparency,
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              return LayoutBuilder(builder: (context, cons) {
                return SizedBox(
                  width: cons.maxWidth,
                  height: cons.maxHeight,
                  child: FlavorConfig.isProduction()
                      ? onViewCreated(context, orientation, cons)
                      : Stack(
                          children: [
                            Positioned.fill(
                                child:
                                    onViewCreated(context, orientation, cons)),
                            showBanner
                                ? Positioned(
                                    right: 0,
                                    top: 20,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 55, right: 50),
                                      child: Banner(
                                        message:
                                            FlavorConfig.instance.flavor.name,
                                        location: BannerLocation.bottomStart,
                                      ),
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                );
              });
            },
          )),
    );
  }
}
