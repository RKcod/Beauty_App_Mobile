import 'package:beauty_app_mobile/core/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../common/custom_header_sheet.dart';
import '../packages/sliding_sheet/sliding_sheet.dart';

void handleHttpError(BuildContext context, HttpErrorType error) {
  if (error == HttpErrorType.connectionTimeout) {
    showToast(context, content: "La requête prend trop de temps. Réessayez");
  } else if (error == HttpErrorType.socketException) {
    showToast(context, content: "Vérifiez votre connexion internet");
  }
}

Future<void> ensureVisibleOnTextArea({required GlobalKey textfieldKey}) async {
  final keyContext = textfieldKey.currentContext;
  if (keyContext != null) {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      if (keyContext.mounted) {
        Scrollable.ensureVisible(
          keyContext,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
        );
      }
    });
  }
}

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        content,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

void showToast(BuildContext context,
    {String content = "Une erreur est survenue", bool isError = true}) {
  var fToast = FToast();
  fToast.init(context);

  fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: isError ? Colors.redAccent : Colors.greenAccent,
        ),
        alignment: Alignment.center,
        child: Text(
          content,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      positionedToastBuilder: (context, child, gravity) {
        return Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          child: child,
        );
      },
      toastDuration: const Duration(seconds: 2));
}

void showCustomBottomSheet(BuildContext context,
    {required String title,
    Widget? body,
    Widget Function(BuildContext, ScrollController, SheetState)?
        customBuilder}) {
  showSlidingBottomSheet(context,
      builder: (builder) => SlidingSheetDialog(
          avoidStatusBar: true,
          duration: const Duration(milliseconds: 500),
          snapSpec: const SnapSpec(snappings: [0, 1]),
          cornerRadius: 8,
          cornerRadiusOnFullscreen: 0,
          headerBuilder: (context, state) => Material(
                color: Colors.transparent,
                child: CustomHeaderSheet(
                  title: title,
                ),
              ),
          builder: body == null
              ? null
              : (context, state) => Material(
                    color: Colors.transparent,
                    child: body,
                  ),
          customBuilder: customBuilder));
}
