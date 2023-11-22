import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/app_constance/app_dimensions.dart';
import 'package:football_app/widgets/default_custom_text.dart';

import '../../app_constance/values_manager.dart';

class LeagueShape extends StatelessWidget {
  const LeagueShape({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(AppSize.s8),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(AppSize.s10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CachedNetworkImage(
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: AppDimensions.screenHeight(context)*0.15,
          ),
          DefaultCustomText(
            text: name,
          )
        ],
      ),
    );
  }
}
