import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

ToastificationItem NotificationShow(
    BuildContext context, String title, ToastificationType type) {
  return toastification.show(
    context: context,
    type: type,
    style: ToastificationStyle.flat,
    title: title,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 2),
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: highModeShadow,
    direction: TextDirection.rtl,
    dragToClose: true,
    showProgressBar: false,
    closeButtonShowType: CloseButtonShowType.onHover,
  );
}
