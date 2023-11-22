import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_constance/app_dimensions.dart';
import '../../app_constance/values_manager.dart';
import '../../view_model/app_cubit.dart';
import '../../view_model/app_state.dart';
import '../../widgets/default_custom_text.dart';
import 'empty_screen.dart';

class TeamsPosition extends StatelessWidget {
  const TeamsPosition({super.key, required this.leagueId});

  final String leagueId;

  @override
  Widget build(BuildContext context) {
    double hSize = AppDimensions.screenHeight(context);
    double wSize = AppDimensions.screenWidth(context);
    return BlocProvider(
      create: (context) => AppCubit()..getStandings(leagueId: leagueId),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of(context);
          switch (state.runtimeType) {
            case GetStandingsLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case GetStandingsSuccessState:
              return Column(
                children: [
                  Row(
                    children: [
                      const DefaultCustomText(
                        text: 'Pos',
                      ),
                      SizedBox(
                        width: wSize * 0.1,
                      ),
                      const DefaultCustomText(
                        text: 'Team',
                      ),
                      SizedBox(
                        width: wSize * 0.23,
                      ),
                      const DefaultCustomText(
                        text: 'G',
                      ),
                      SizedBox(
                        width: wSize * 0.06,
                      ),
                      const DefaultCustomText(
                        text: 'W',
                      ),
                      SizedBox(
                        width: wSize * 0.05,
                      ),
                      const DefaultCustomText(
                        text: 'D',
                      ),
                      SizedBox(
                        width: wSize * 0.05,
                      ),
                      const DefaultCustomText(
                        text: 'L',
                      ),
                      SizedBox(
                        width: wSize * 0.06,
                      ),
                      const DefaultCustomText(
                        text: 'P',
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = cubit.standingModel!.standing[index];
                        return Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                height: hSize * 0.06,
                                width: wSize * 0.45,
                                padding: EdgeInsets.all(AppSize.s8),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s8),
                                  color: Theme.of(context).cardColor,
                                ),
                                child: Row(
                                  children: [
                                    DefaultCustomText(
                                      text: data.teamPosition!,
                                    ),
                                    SizedBox(
                                      width: wSize * 0.02,
                                    ),
                                    Expanded(
                                      child: DefaultCustomText(
                                        text: data.teamName!,
                                        fontSize: AppSize.s14,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                cubit.getTeamDetails(
                                    context: context, teamId: data.teamId!);
                              },
                            ),
                            SizedBox(
                              width: wSize * 0.04,
                            ),
                            Container(
                              height: hSize * 0.06,
                              width: wSize * 0.44,
                              padding: EdgeInsets.all(AppSize.s8),
                              margin:
                                  EdgeInsets.symmetric(vertical: AppSize.s2),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s8),
                                color: Theme.of(context).cardColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DefaultCustomText(
                                    text: data.teamPlayedMatches!,
                                  ),
                                  SizedBox(
                                    width: wSize * 0.04,
                                  ),
                                  DefaultCustomText(
                                    text: data.teamWinGames!,
                                  ),
                                  SizedBox(
                                    width: wSize * 0.04,
                                  ),
                                  DefaultCustomText(
                                    text: data.teamDrawGames!,
                                  ),
                                  SizedBox(
                                    width: wSize * 0.04,
                                  ),
                                  DefaultCustomText(
                                    text: data.teamLoseGames!,
                                  ),
                                  SizedBox(
                                    width: wSize * 0.04,
                                  ),
                                  DefaultCustomText(
                                    text: data.teamPoints!,
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: cubit.standingModel!.standing.length,
                    ),
                  ),
                ],
              );
            case GetStandingsErrorState:
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
