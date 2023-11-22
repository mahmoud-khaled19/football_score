import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:football_app/app_constance/constants_methods.dart';
import 'package:football_app/view/inner_screens/competition_details.dart';
import 'package:football_app/view_model/app_state.dart';
import '../../app_constance/values_manager.dart';
import '../../view_model/app_cubit.dart';
import '../components/competition_shape.dart';
import 'empty_screen.dart';

class CompetitionsScreen extends StatelessWidget {
  const CompetitionsScreen(
      {super.key, required this.countryId, required this.countryName});

  final String? countryId;
  final String? countryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getCompetitions(countryId),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of(context);
          switch (cubit.competitionsModel != null) {
            case true:
              return Scaffold(
                appBar: AppBar(
                  title: Text(countryName!),
                ),
                body: Padding(
                  padding: EdgeInsets.all(AppSize.s10),
                  child: GridView.custom(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverWovenGridDelegate.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      pattern: [
                        const WovenGridTile(1),
                        const WovenGridTile(
                          7 / 10,
                          crossAxisRatio: 0.9,
                          alignment: AlignmentDirectional.centerEnd,
                        ),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) {
                        var data = cubit.competitionsModel!.competitions[index];
                        return GestureDetector(
                          onTap: () {
                            GlobalMethods.navigateTo(
                              context,
                              CompetitionDetails(
                                leagueId: data.leagueId!,
                                leagueName: data.leagueName!,
                                leagueSeason: data.leagueSeason!,
                              ),
                            );
                          },
                          child: LeagueShape(
                            image: data.leagueLogo!,
                            name: data.leagueName!,
                          ),
                        );
                      },
                      childCount: cubit.competitionsModel!.competitions.length,
                    ),
                  ),
                ),
              );

            case false:
              return const EmptyScreen();
          }
        },
      ),
    );
  }
}
