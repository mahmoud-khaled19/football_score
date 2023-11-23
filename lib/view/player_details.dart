import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/app_constance/app_dimensions.dart';
import 'package:football_app/view/inner_screens/empty_screen.dart';
import 'package:football_app/widgets/default_custom_text.dart';
import 'package:shimmer/shimmer.dart';
import '../app_constance/values_manager.dart';
import '../view_model/app_cubit.dart';
import '../view_model/app_state.dart';
import 'components/player_details_shape.dart';

class PlayerDetails extends StatelessWidget {
  const PlayerDetails({super.key, required this.playerId});

  final String playerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider(
        create: (context) => AppCubit()..getPlayerDetails(playerId: playerId),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            AppCubit cubit = BlocProvider.of(context);
            switch (state.runtimeType) {
              case GetPlayerDetailsLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case GetPlayerDetailsSuccessState:
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = cubit.playerModel?.playerStatics[index];
                    return Padding(
                      padding: EdgeInsets.all(AppSize.s10),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            height: AppDimensions.screenHeight(context) * 0.2,
                            width: AppDimensions.screenWidth(context) * 0.4,
                            imageUrl: data?.playerImage ?? '',
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.grey.shade900,
                              child: Container(
                                height:
                                    AppDimensions.screenHeight(context) * 0.2,
                                width: AppDimensions.screenWidth(context) * 0.4,
                                margin: EdgeInsets.all(AppSize.s10),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s10)),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset('assets/no_image.png'),
                          ),
                          DefaultCustomText(
                            text: data!.playerName,
                            fontSize: AppSize.s16,
                          ),
                          DefaultCustomText(
                            text: data.teamName,
                            color: Theme.of(context).primaryColor,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Type',
                            value: data.playerType,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Number',
                            value: data.playerNumber,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Match Played',
                            value: data.playerMatchPlayed.isEmpty
                                ? '0'
                                :data.playerMatchPlayed,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Minutes Played',
                            value: data.playerMinutes.isEmpty
                                ? '0':data.playerMinutes,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Goals',
                            value: data.playerGoals.isEmpty
                                ? '0':data.playerGoals,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Assets',
                            value: data.playerAssists.isEmpty
                                ? '0':data.playerAssists,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Shots',
                            value: data.playerShotsTotal.isEmpty
                                ? '0':data.playerShotsTotal,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Penalty Won',
                            value: data.playerPenWon.isEmpty
                                ? '0'
                                : data.playerPenWon,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Penalty Scored',
                            value: data.playerPenScored.isEmpty
                                ? '0':data.playerPenScored,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Penalty Missed',
                            value: data.playerPenMissed.isEmpty
                                ? '0'
                                : data.playerPenMissed,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Crosses',
                            value: data.playerCrossesTotal.isEmpty
                                ? '0':data.playerCrossesTotal,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Dribble Attempts',
                            value: data.playerDribbleAttempts.isEmpty
                                ? '0':data.playerDribbleAttempts,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Dribble Success',
                            value: data.playerDribbleSucc.isEmpty
                                ? '0':data.playerDribbleSucc,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Red Cards',
                            value: data.playerRedCards.isEmpty
                                ? '0':data.playerRedCards,
                          ),
                          PlayerDetailsShape(
                            title: 'Player yellow Cards',
                            value: data.playerYellowCards.isEmpty
                                ? '0':data.playerYellowCards,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Saves',
                            value: data.playerSaves.isEmpty
                                ? '0'
                                : data.playerSaves,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Wood Works',
                            value: data.playerWoodworks.isEmpty
                                ? '0'
                                : data.playerWoodworks,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Rating',
                            value: data.playerRating.isEmpty
                                ? '0'
                                : data.playerRating,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Key Passes',
                            value: data.playerKeyPasses.isEmpty
                                ? '0'
                                : data.playerKeyPasses,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Interceptions',
                            value: data.playerInterceptions.isEmpty
                                ? '0'
                                : data.playerInterceptions,
                          ),
                          PlayerDetailsShape(
                            title: 'player Passes ',
                            value: data.playerPassesAccuracy.isEmpty
                                ? '0'
                                : data.playerPassesAccuracy,
                          ),
                          PlayerDetailsShape(
                            title: 'player Goal Conceded ',
                            value: data.playerGoalsConceded.isEmpty
                                ? '0'
                                : data.playerGoalsConceded,
                          ),
                          PlayerDetailsShape(
                            title: 'player Injured ',
                            value: data.playerInjured.isEmpty
                                ? '0'
                                : data.playerInjured,
                          ),
                          PlayerDetailsShape(
                            title: 'player inside Box Saves ',
                            value: data.playerInsideBoxSaves.isEmpty
                                ? '0'
                                : data.playerInsideBoxSaves,
                          ),
                          PlayerDetailsShape(
                            title: 'player Duels',
                            value: data.playerDuelsTotal.isEmpty
                                ? '0'
                                : data.playerDuelsTotal,
                          ),
                          PlayerDetailsShape(
                            title: 'player Success Duels',
                            value: data.playerDuelsWon.isEmpty
                                ? '0'
                                : data.playerDuelsWon,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Tackles',
                            value: data.playerTackles.isEmpty
                                ? '0'
                                : data.playerTackles,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Blocs',
                            value: data.playerBlocks.isEmpty
                                ? '0'
                                : data.playerBlocks,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Clearances',
                            value: data.playerClearances.isEmpty
                                ? '0'
                                : data.playerClearances,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Age',
                            value: data.playerAge.isEmpty
                                ? '-':data.playerAge,
                          ),
                          PlayerDetailsShape(
                            title: 'Player Birth Date',
                            value: data.playerBirthdate.isEmpty
                                ? '-':data.playerBirthdate,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 1,
                );
              case GetPlayerDetailsErrorState:
                return const EmptyScreen();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
