import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/view/inner_screens/empty_screen.dart';
import '../../app_constance/app_dimensions.dart';
import '../../app_constance/values_manager.dart';
import '../../view_model/app_cubit.dart';
import '../../view_model/app_state.dart';
import '../../widgets/default_custom_text.dart';

class TopScorerScreen extends StatelessWidget {
  const TopScorerScreen({super.key, required this.leagueId});

  final String leagueId;

  @override
  Widget build(BuildContext context) {
    double hSize = AppDimensions.screenHeight(context);
    double wSize = AppDimensions.screenWidth(context);
    return BlocProvider(
      create: (context) => AppCubit()..getTopScorer(leagueId: leagueId),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of(context);
          switch (state.runtimeType) {
            case GetTopScorerLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case GetTopScorerSuccessState:
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = cubit.playerModel?.player[index];
                        return Row(
                          children: [
                            Container(
                              height: hSize * 0.07,
                              width: wSize * 0.3,
                              margin: EdgeInsets.all(AppSize.s8),
                              padding: EdgeInsets.all(AppSize.s8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSize.s8),
                                color: Theme.of(context).cardColor,
                              ),
                              child: Row(
                                children: [
                                  DefaultCustomText(
                                    text: data!.playerPlace ?? 'Test Name',
                                  ),
                                  SizedBox(
                                    width: wSize * 0.02,
                                  ),
                                  Expanded(
                                    child: DefaultCustomText(
                                      text: data.playerName ?? '',
                                      fontSize: AppSize.s14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: wSize * 0.04,
                            ),
                            Container(
                              height: hSize * 0.06,
                              width: wSize * 0.55,
                              padding: EdgeInsets.all(AppSize.s8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSize.s8),
                                color: Theme.of(context).cardColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DefaultCustomText(
                                    text: data.teamName!,
                                  ),
                                  SizedBox(
                                    width: wSize * 0.04,
                                  ),
                                  DefaultCustomText(
                                    text: data.goals!,
                                  ),
                                  // SizedBox(
                                  //   width: wSize * 0.04,
                                  // ),
                                  // DefaultCustomText(
                                  //   text: data.assists!,
                                  // ),
                                  // SizedBox(
                                  //   width: wSize * 0.04,
                                  // ),
                                  // DefaultCustomText(
                                  //   text: data.penaltyGoals!,
                                  // ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: cubit.playerModel?.player.length ?? 10,
                    ),
                  ),
                ],
              );
            case GetTopScorerErrorState:
              return const EmptyScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
