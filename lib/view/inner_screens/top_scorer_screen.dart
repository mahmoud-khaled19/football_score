import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/app_constance/constants_methods.dart';
import 'package:football_app/view/inner_screens/empty_screen.dart';
import '../../app_constance/app_dimensions.dart';
import '../../app_constance/values_manager.dart';
import '../../view_model/app_cubit.dart';
import '../../view_model/app_state.dart';
import '../../widgets/default_custom_text.dart';
import '../player_details.dart';

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
                  Row(
                    children: [
                      const DefaultCustomText(
                        text: 'Pos',
                      ),
                      SizedBox(
                        width: wSize * 0.12,
                      ),
                      const DefaultCustomText(
                        text: 'P.Name',
                      ),
                      SizedBox(
                        width: wSize * 0.24,
                      ),
                      const DefaultCustomText(
                        text: 'G',
                      ),
                      SizedBox(
                        width: wSize * 0.12,
                      ),
                      const DefaultCustomText(
                        text: 'A',
                      ),
                      SizedBox(
                        width: wSize * 0.09,
                      ),
                      const DefaultCustomText(
                        text: 'P.G',
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = cubit.topScorerModel?.player[index];
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                GlobalMethods.navigateTo(
                                    context,
                                    PlayerDetails(
                                      playerId: data.playerKey!.toString(),
                                    ));
                              },
                              child: Stack(
                                //  alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    height: hSize * 0.07,
                                    width: wSize * 0.5,
                                    margin: EdgeInsets.all(AppSize.s8),
                                    padding: EdgeInsets.all(AppSize.s8),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s8),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    child: Row(
                                      children: [
                                        DefaultCustomText(
                                          text:
                                              data!.playerPlace ?? 'Test Name',
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
                                  DefaultCustomText(
                                    text: data.teamName!,
                                    fontSize: AppSize.s12,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: wSize * 0.01,
                            ),
                            Container(
                              height: hSize * 0.06,
                              width: wSize * 0.38,
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
                                    text: data.goals!,
                                  ),
                                  SizedBox(
                                    width: wSize * 0.04,
                                  ),
                                  DefaultCustomText(
                                    text: data.assists!.isEmpty
                                        ? '0'
                                        : data.assists!,
                                  ),
                                  SizedBox(
                                    width: wSize * 0.04,
                                  ),
                                  DefaultCustomText(
                                    text: data.penaltyGoals!,
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: cubit.topScorerModel?.player.length ?? 10,
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
