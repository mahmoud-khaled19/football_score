import 'package:flutter/material.dart';

import '../../app_constance/app_dimensions.dart';
import '../../app_constance/values_manager.dart';
import '../../widgets/default_custom_text.dart';

class PlayerDetailsShape extends StatelessWidget {
  const PlayerDetailsShape(
      {super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSize.s12),
      margin: EdgeInsets.only(bottom: AppSize.s10),
      width: double.infinity,
      height: AppDimensions.screenHeight(context) * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
          color: Theme.of(context).cardColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultCustomText(
            text: title,
          ),
          DefaultCustomText(
            text: value,
          ),
        ],
      ),
    );
  }
}
