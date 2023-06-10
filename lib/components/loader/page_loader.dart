import 'package:event_app/common/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PageLoader extends StatelessWidget {
  const PageLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Get.height,
      width: Get.width,
      color: Colors.transparent.withOpacity(0.2),
      child: const SpinKitFadingCircle(
        color: Palette.primary,
      ),
    );
  }
}
