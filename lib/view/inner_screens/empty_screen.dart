import 'package:flutter/material.dart';

import '../../app_constance/values_manager.dart';
import '../../widgets/default_custom_text.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/error_Page.png',
            height: size * 0.4,
            width: size * 0.8,
          ),
          SizedBox(
            height: AppSize.s30,
          ),
          Center(
            child: DefaultCustomText(
              text: 'Error Happened',
              alignment: Alignment.center,
              fontSize: AppSize.s20,
              color: Theme.of(context).splashColor,
            ),
          )
        ],
      ),
    );
  }
}
