import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/view_model/app_cubit.dart';
import 'package:football_app/widgets/default_custom_text.dart';

import '../../view_model/app_state.dart';

class TeamDetails extends StatelessWidget {
  const TeamDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(itemBuilder: (context,state){
            return Column(
              children: [
                CachedNetworkImage(imageUrl: cubit.teamModel?.team[0].teamBadge??''),
                DefaultCustomText(text: cubit.teamModel?.team[0].teamName??''),
                DefaultCustomText(text: cubit.teamModel?.team[0].teamCountry??''),
              ],
            );
          }),
        );
      },
    );
  }
}
