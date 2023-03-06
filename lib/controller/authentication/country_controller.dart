import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class CountryController extends GetxController {
  RxInt selectedCountryCode = 0.obs;

  void showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: Get.overlayContext!,
      builder: (BuildContext context) => Container(
        height: 300,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  
}
