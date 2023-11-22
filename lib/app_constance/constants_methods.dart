import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GlobalMethods {
  static void navigateAndFinish(context, widget) {
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            type: PageTransitionType.scale,
            alignment: Alignment.center,
            child: widget,
            duration: const Duration(milliseconds: 1500)),
        (route) => false);
  }

  static void navigateTo(context, widget) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.scale,
            alignment: Alignment.center,
            child: widget,
            duration: const Duration(milliseconds: 1500)));
  }

  static validate(text, String? value) {
    if (value!.isEmpty) {
      return text;
    } else {
      return null;
    }
  }

  static showAlertDialog({
    required BuildContext context,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).cardColor,
            title: title,
            content: content,
            actions: actions,
          );
        });
  }

  // static openWhatsApp(String phoneNumber) async {
  //   final Uri url = Uri.parse('https://wa.me/$phoneNumber');
  //   await launchUrl(
  //     url,
  //     mode: LaunchMode.externalApplication,
  //   );
  // }
  static String? token;
}
